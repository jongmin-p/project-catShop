package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.member.command.FindId;
import com.yedam.member.command.FindIdForm;
import com.yedam.member.command.FindIdResult;
import com.yedam.member.command.FindPwd;
import com.yedam.member.command.FindPwdForm;
import com.yedam.member.command.FindPwdResult;
import com.yedam.member.command.IdCheck;
import com.yedam.member.command.Login;
import com.yedam.member.command.LoginForm;
import com.yedam.member.command.LogoutControl;
import com.yedam.member.command.MemberList;
import com.yedam.member.command.MemberManager;
import com.yedam.member.command.MemberRemove;
import com.yedam.member.command.MemberUpdate;
import com.yedam.member.command.SearchMemberManage;
import com.yedam.member.command.Signup;
import com.yedam.member.command.selectCouponControl;
import com.yedam.mypage.command.MyPageControl;
import com.yedam.mypage.command.OrderListControl;
import com.yedam.mypage.command.MyNoticeListControl;
import com.yedam.mypage.command.UpdateInfo;
import com.yedam.mypage.command.UpdateInfoForm;
import com.yedam.mypage.command.ZzimDeleteControl;
import com.yedam.mypage.command.ZzimListControl;
import com.yedam.notice.command.AddNoticeControl;
import com.yedam.notice.command.AddNoticeFormControl;
import com.yedam.notice.command.NoticeDeleteControl;
import com.yedam.notice.command.NoticeDetailControl;
import com.yedam.notice.command.NoticeListControl;
import com.yedam.notice.command.NoticeUpdateControl;
import com.yedam.notice.command.NoticeUpdateFormControl;
import com.yedam.order.control.addOrderControl;

import com.yedam.order.control.addOrderProductControl;
import com.yedam.order.control.addPaymentControl;
import com.yedam.order.control.beforAddrControl;
import com.yedam.order.control.orderControl;
import com.yedam.order.control.orderManageControl;
import com.yedam.order.control.refundInfoControl;
import com.yedam.order.control.searchOrderControl;
import com.yedam.order.control.updateOrderStatusControl;
import com.yedam.product.command.InsertProductManager;
import com.yedam.product.command.InsertReview;
import com.yedam.product.command.ModifyProductManager;
import com.yedam.product.command.ModifyReviewManage;
import com.yedam.product.command.ProductCartAdd;
import com.yedam.product.command.ProductDetail;
import com.yedam.product.command.ProductManagerList;
import com.yedam.product.command.ProductManagerPage;
import com.yedam.product.command.ProductMangerAddPage;
import com.yedam.product.command.RemoveProductManager;
import com.yedam.product.command.RemoveReviewManage;
import com.yedam.product.command.ReviewManage;
import com.yedam.product.command.ReviewManageList;
import com.yedam.product.command.SearchProductManage;
import com.yedam.product.command.SearchReviewDate;
import com.yedam.product.command.SearchReviewManage;
import com.yedam.product.command.addZzimControl;
import com.yedam.product.command.cartControl;
import com.yedam.product.command.removeCartControl;
import com.yedam.product.command.searchProductControl;
import com.yedam.qa.command.InsertProductQa;
import com.yedam.qa.command.ProductQaPage;
import com.yedam.qa.command.QaList;
import com.yedam.qa.command.QaManagerForm;
import com.yedam.qa.command.QaRemove;
import com.yedam.qa.command.SearchQaManage;
import com.yedam.qa.command.QaUpdate;
import com.yedam.zzim.command.ProductZzimAdd;
import com.yedam.zzim.command.ProductZzimDel;




public class FrontController extends HttpServlet {

	private Map<String, Command> map;
	private String charset;

	public FrontController() {
		map = new HashMap<String, Command>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		charset = config.getInitParameter("charset");
		//효상
		map.put("/main.do", new MainControl()); //메인페이지
		map.put("/orderPage.do", new orderControl()); //주문페이지
		map.put("/searchProduct.do", new searchProductControl()); //검색 결과
		map.put("/logOut.do", new LogoutControl()); //로그아웃
		map.put("/cart.do", new cartControl()); //메인에서 장바구니 담기
		map.put("/addZzim.do", new addZzimControl()); //찜추가 기능
		map.put("/selectCoupon.do", new selectCouponControl()); //쿠폰 조회 기능
		map.put("/addOrder.do", new addOrderControl()); //주문정보 저장 기능
		map.put("/removeCart.do", new removeCartControl()); //장바구니 삭제
		
		map.put("/adminMain.do", new adminMainControl()); //관리자페이지 메인
		map.put("/orderManage.do", new orderManageControl()); //주문관리페이지
		
		map.put("/addPayment.do", new addPaymentControl()); //지불정보 입력
		map.put("/addOrderProduct.do", new addOrderProductControl()); //주문상품정보 입력
		map.put("/searchOrder.do", new searchOrderControl()); //주문상품정보 입력
		map.put("/beforAddr.do", new beforAddrControl()); //이전 주소 불러오기
		map.put("/updateOrderStatus.do", new updateOrderStatusControl()); //배송 상태 변경
		map.put("/refundInfo.do", new refundInfoControl()); //환불 정보 조회

		//민규
		map.put("/productDetail.do", new ProductDetail()); // 제품 상세 페이지
		map.put("/productCartAdd.do", new ProductCartAdd()); // 제품을 장바구니에 추가
		map.put("/productZzimAdd.do", new ProductZzimAdd()); // 제품을 찜에 추가
		map.put("/productZzimDel.do", new ProductZzimDel()); // 제품 찜 취소
		map.put("/productManagerPage.do", new ProductManagerPage()); // 관리자 전용 상품 페이지
		map.put("/productManagerList.do", new ProductManagerList()); // 관리자 전용 상품 리스트
		map.put("/removeProductManager.do", new RemoveProductManager()); // 관리자 전용 상품 삭제
		map.put("/modifyProductManager.do", new ModifyProductManager()); // 관리자 전용 상품 수정
		map.put("/productManagerAddPage.do", new ProductMangerAddPage()); // 관리자 전용 상품 등록페이지
		map.put("/insertProductManager.do", new InsertProductManager()); // 관리자 전용 상품 등록
		map.put("/productQaPage.do", new ProductQaPage()); // Q&A 페이지
		map.put("/insertProductQa.do", new InsertProductQa()); // Q&A 등록
		map.put("/reviewManage.do", new ReviewManage()); // 관리자 전용 리뷰 페이지
		map.put("/reviewManageList.do", new ReviewManageList()); // 관리자 전용 리뷰 리스트
		map.put("/removeReviewManage.do", new RemoveReviewManage()); // 관리자 전용 리뷰 삭제
		map.put("/modifyReviewManage.do", new ModifyReviewManage()); // 관리자 전용 리뷰 수정
		map.put("/searchReviewManage.do", new SearchReviewManage()); // 관리자 리뷰 검색
		map.put("/searchReviewDate.do", new SearchReviewDate()); // 리뷰 날짜 검색
		map.put("/searchProductManage.do", new SearchProductManage()); // 관리자 상품 검색
		map.put("/insertReview.do", new InsertReview()); // 리뷰 등록

		
		//종민
		map.put("/loginForm.do", new LoginForm());
		map.put("/login.do", new Login());
		map.put("/signup.do", new Signup());
		map.put("/memberManageForm.do", new MemberManager());	// 관리자 화면 등록 폼
		map.put("/memberList.do", new MemberList());			//관리자 화면 리스트
		map.put("/removeMember.do", new MemberRemove());		//관리자 화면에서 삭제
		map.put("/updateMember.do", new MemberUpdate());		//관리자 화면에서 수정
		map.put("/findIdForm.do", new FindIdForm());			// 아이디 찾기 화면
		map.put("/findPwdForm.do", new FindPwdForm());			// 비번 찾기 화면
		map.put("/findId.do", new FindId());					// 아이디 찾기 처리
		map.put("/findIdResult.do", new FindIdResult());
		map.put("/findPwd.do", new FindPwd());					// 비번 찾기 처리 (임시 비밀번호)
		map.put("/findPwdResult.do", new FindPwdResult());			// 임시 비밀번호 보낸 후 알림 페이지
		map.put("/idCheck.do", new IdCheck());					// 아이디 중복 확인
		//
		map.put("/qaManageForm.do", new QaManagerForm());		// Q&A 게시판 관리
		map.put("/qaList.do", new QaList());
		map.put("/removeQa.do", new QaRemove());
		map.put("/updateQa.do", new QaUpdate());
		map.put("/searchQaManage.do", new SearchQaManage());			// QA 게시판 검색 (상품번호 proId 이용)
		//
		map.put("/searchMemberManage.do", new SearchMemberManage());
		
		
		
		
		
		
		//주안
		map.put("/myPage.do",new MyPageControl()); //마이페이지 디폴트가 주문내역 이동
		map.put("/zzimList.do", new ZzimListControl()); // zzim목록 출력
		map.put("/noticeList.do", new NoticeListControl()); //공지사항페이지 이동
		map.put("/addNoticeForm.do", new AddNoticeFormControl()); //공지사항 작성 폼
		map.put("/addNotice.do", new AddNoticeControl()); //공지사항 작성기능
		map.put("/noticeDetail.do", new NoticeDetailControl()); //공지사항 상세보기
		map.put("/noticeDelete.do", new NoticeDeleteControl()); //공지사항 삭제
		map.put("/noticeUpdateForm.do", new NoticeUpdateFormControl()); //공지사항 수정페이지이동
		map.put("/noticeUpdate.do", new NoticeUpdateControl()); //공지사항 수정기능
		map.put("/updateInfoForm.do", new UpdateInfoForm()); //개인정보 수정페이지
		map.put("/updateInfo.do", new UpdateInfo()); //개인정보 수정기능
		map.put("/zzimDelete.do", new ZzimDeleteControl()); //찜 삭제
		map.put("/orderList.do", new OrderListControl()); //주문내역 
		map.put("/myNoticeList.do", new MyNoticeListControl()); //mypage 후기,qna
		
		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(charset);

		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String page = uri.substring(context.length());
		System.out.println(page);

		Command command = map.get(page);
		String viewPage = command.exec(req, resp);
		// notice/noticeList.tiles

		if (viewPage.endsWith(".tiles")) {
			RequestDispatcher rd = req.getRequestDispatcher(viewPage);
			rd.forward(req, resp);

		} else if (viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);

		} else if (viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=utf-8");
			resp.getWriter().print(viewPage.substring(0, viewPage.length() - 5));
		}

	}
}
