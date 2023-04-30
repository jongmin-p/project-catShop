package com.yedam.member.command;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class FindPwd implements Command {
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String id = req.getParameter("id");
		
		// System.out.println("테스트 " + name);
		// System.out.println("테스트 " + email);
		// System.out.println("테스트 " + id);

		MemberService service = new MemberServiceMybatis();

		MemberVO fPwd = service.findPwd(name, email, id);


		
		// fId 가 뭔가를 반환받았다면(즉, 아이디를 받환받았다면)
		if (fPwd == null) {
			// 에러 메시지 출력 후 다시 findIdForm화면으로
			// req.setAttribute("error", "해당하는 계정이 없는데요");
//			HttpSession session = req.getSession();
//			session.setAttribute("error", "해당하는 계정이 없는데요");
			
			return "{ \"retCode\" : \"Fail\" }.json";
		}

		
		fPwd.setMemEmail(email);
		System.out.println("이메일 주소 잘 넘어왔는지 확인 = " + fPwd.getMemEmail());
		
		
		final String fromEmail = "randomm.012345@gmail.com"; // replace with your email
		final String password = "rpepcyfkbxighbji"; // replace with your email password

		final String toEmail = fPwd.getMemEmail();

		////////////////////////////////////////////////////////////////////////////////////////////

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // for gmail
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		////////////////////////////////////////////////////////////////////////////////////////////

		// 인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		String AuthenticationKey = temp.toString();
		System.out.println("임시 비밀번호 = " + AuthenticationKey);

		////////////////////////////////////////////////////////////////////////////////////////////
		
		// 생성된 임시 비밀번호를 가지고, DB에서 mem_pw 값을 변경함
		fPwd.setMemId(id);
		fPwd.setMemPw(AuthenticationKey);
		service.setTempPwd(fPwd);
		
		////////////////////////////////////////////////////////////////////////////////////////////

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});

		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////

		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromEmail, "예담 반려용품 쇼핑몰"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

			// 메일 제목
			msg.setSubject("예담 반려용품 쇼핑몰 임시 비밀번호 안내 메일입니다.");
			// 메일 내용 (바디)
			msg.setText("안녕하세요, " + name + "님.\n회원님의 임시 비밀번호는 :  " + temp + " 입니다.");

			Transport.send(msg);
			System.out.println("이메일 전송 완료!");
			
		
			
			return "{ \"retCode\" : \"Success\" }.json";
		} catch (Exception e) {
			e.printStackTrace();
			return "이메일 전송 실패";				// 근데 애초에 비번 찾을 때 정보가 틀리면 findPwdForm.do 로 이동하게 돼있다. (Line 38)
		}

		////////////////////////////////////////////////////////////////////////////////////////////
	}
}
