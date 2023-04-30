<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <style>
      * {
        padding: 0;
        margin: 0;
        border: none;
      }

      body {
        font-size: 14px;
        font-family: "Roboto", sans-serif;
      }

      .login-wrapper {
        width: 400px;
        height: 350px;
        padding: 40px;
        box-sizing: border-box;
        margin: 0 auto;
      }

      .login-wrapper > h2 {
        font-size: 30px;
        color: #6a24fe;
        margin-bottom: 20px;
      }

      .login-wrapper,
      .info-wrapper {
        text-align: center;
      }

      .login-wrapper > input {
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #d3d3d3;
      }

      .login-wrapper > input::placeholder {
        color: #797979;
      }

      .login-wrapper > input[type="submit"] {
        color: #fff;
        font-size: 16px;
        background-color: #6a24fe;
        margin-top: 20px;
      }

      /* 회원가입 버튼 */
      .btn-open-popup {
        padding: 5px;
        border-radius: 6px;
        color: #fff;
        font-size: 16px;
        background-color: lightcoral;
        margin-top: 20px;
      }

      /* 모달 창 위치 조정 */
      .modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      #modal-title {
        font-size: 1.5rem;
        font-weight: bolder;
        color: #6a24fe;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 35%;
        /* height: 500px; */
        padding: 40px;
        text-align: center;
        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
        transform: translateX(-50%) translateY(-50%);
      }

      form > button[type="submit"] {
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        color: #fff;
        font-size: 16px;
        background-color: #6a24fe;
        margin-top: 20px;
      }

      /* 모달 창 내의 input 태그 꾸미기 */
      form > input {
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #d3d3d3;
      }

      form > input::placeholder {
        color: #797979;
      }

      #signUpBtn {
        border: 1px solid rgb(42, 129, 243);
        color: rgb(42, 129, 243);
        background-color: white;
        padding: 3px;
        border-radius: 5px;
      }
    </style>
  </head>

  <body>
    <div class="login-wrapper">
      <h2>로그인</h2>
      <div id="errorMsg"></div>
      <!-- 여기다가 에러 메시지 출력 -->

      <input type="text" id="mid" name="mid" placeholder="ID를 입력하세요" />
      <input
        type="password"
        id="mpw"
        name="mpw"
        placeholder="비밀번호를 입력하세요"
      />

      <input type="submit" id="loginBtn" value="로그인" />

      <div>
        <div class="info-wrapper">
          <a href="findIdForm.do">ID 찾기</a> |
          <a href="findPwdForm.do">비밀번호 찾기</a><br />
          <span>신규 회원 가입 시 적립금 5천원 지급</span>
          <!-- Button trigger modal -->
          <button
            type="button"
            id="signUpBtn"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            회원가입
          </button>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div
      class="modal fade"
      id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5> -->
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <span id="modal-title">개인 정보를 작성해 주세요</span>
            <!-- <hr> -->

            <form
              action="signup.do"
              method="POST"
              onsubmit="return formCheck(this);"
            >
              <div id="id_check"></div>
              <!-- 여기다가 메세지 띄울거임. (중복 여부 메시지) -->
              <div id="msg" class="msg"></div>

              <input
                type="text"
                id="member_id"
                name="member_id"
                placeholder="아이디를 입력해 주세요 (최소 5글자 이상)"
              /><br />
              <input
                type="password"
                id="member_pw"
                placeholder="비밀번호를 입력해 주세요 (최소 5글자 이상)"
                name="member_pw"
                autofocus
              /><br />
              <input
                type="password"
                id="member_confirm_pw"
                placeholder="비밀번호를 다시 한 번 입력해 주세요 (최소 5글자 이상)"
                name="member_confirm_pw"
              /><br />
              <input
                type="text"
                id="member_name"
                placeholder="이름을 입력해 주세요"
                name="member_name"
              /><br />
              <input
                type="text"
                id="member_phone"
                placeholder="연락처를 입력해 주세요"
                name="member_phone"
              /><br />
              <input
                type="email"
                id="member_email"
                placeholder="이메일을 입력해 주세요"
                name="member_email"
              /><br />
              <!-- 유저 회원가입이니까 DB에서 mem_user 컬럼의 값을 자동으로 user 로 숨겨서 전달하기 -->
              <input type="hidden" name="member_user" value="user" />

              <!-- 버튼 클릭시 signUpForm.do 로 이동 -->
              <button type="submit" id="reg_submit">가입하기</button>
              <button
                type="button"
                id="closeBtn"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                닫기
              </button>
            </form>
          </div>
          <div class="modal-footer">
            <!-- <button type="button" class="btn btn-primary">Understood</button> -->
          </div>
        </div>
      </div>
    </div>

    <script>
      // 회원가입 모달에서 닫기 클릭 시, 모든 인풋 값 초기화
      closeBtn.addEventListener("click", function () {
        document.getElementById("member_id").value = "";
        document.getElementById("member_pw").value = "";
        document.getElementById("member_confirm_pw").value = "";
        document.getElementById("member_name").value = "";
        document.getElementById("member_phone").value = "";
        document.getElementById("member_email").value = "";
        document.getElementById("id_check").innerHTML = null;
        document.getElementById("msg").innerHTML = null;
      });


// 회원가입 할 때, 검증하는 함수
      function formCheck(frm) {
        // 빈 칸이 있을 시 에러 메시지 출력하는 변수
        let msg = "";

        // 비밀번호와 재확인용 비밀번호가 일치하는지 확인. (불일치하면, 가입 안 됨)
        if (frm.member_pw.value != frm.member_confirm_pw.value) {
          alert("입력한 비밀번호가 다릅니다.");

          frm.member_pw.value = "";
          frm.member_confirm_pw.value = "";

          return false;
        }

        // 빈 칸 혹은 최소 길이보다 작을 때 에러 메시지 발생
        if (frm.member_id.value == "") {
          setMessage("아이디를 작성해 주세요", frm.member_id);
          return false;
        } else if (frm.member_id.value.length < 5) {
          setMessage("아이디는 최소 5글자 이상 작성해 주세요", frm.member_id);
          return false;
        }

        if (frm.member_pw.value == "") {
          setMessage("비밀번호를 작성해 주세요", frm.member_pw);
          return false;
        } else if (frm.member_pw.value.length < 5) {
          setMessage("비밀번호는 최소 5글자 이상 작성해 주세요", frm.member_pw);
          return false;
        }

        if (frm.member_name.value == "") {
          setMessage("이름을 작성해 주세요", frm.member_name);
          return false;
        }

        if (frm.member_phone.value == "") {
          setMessage("전화번호를 작성해 주세요", frm.member_phone);
          return false;
        }

        if (frm.member_email.value == "") {
          setMessage("email 를 작성해 주세요", frm.member_email);
          return false;
        }

        return true;
      }

      // 빈 칸일 때 에러 메시지 발생
      function setMessage(msg, element) {
        //${msg}는 템플릿 리터럴(JS이므로 브라우저에서 돌아감(EL은 서버에서 돌아감))
        //${'${msg}'}로 변경 해야 함.
        document.getElementById(
          "msg"
        ).innerHTML = `<i class="fa fa-exclamation-circle"> ${"${msg}"}</i>`;
        document.getElementById("msg").style.color = "red";

        if (element) {
          //select는 값이 틀리면 그 값에 커서가 오도록 함.
          element.select();
        }
      }

      // 아이디 중복확인
      $("#member_id").blur(function () {
        // id = "id_reg" / name = "userId"
        let member_id = $("#member_id").val();

        $.ajax({
          url: "idCheck.do",
          type: "post",
          data: {
            id: member_id,
          },
          success: function (result) {
            console.log("1 = 중복o / 0 = 중복x : " + result);

            if (result.retCode == "Success") {
              // 1 : 아이디가 중복되는 문구
              $("#id_check").text("사용중인 아이디입니다 :(");
              $("#id_check").css("color", "red");
              $("#reg_submit").attr("disabled", "disabled");
            } else if (result.retCode == "Fail") {
              $("#id_check").text("사용 가능한 아이디입니다 =)");
              $("#id_check").css("color", "lightseagreen");
              $("#reg_submit").removeAttr("disabled");
            }
          },
          error: function () {
            console.log("실패");
          },
        });
      });

      // 아이디/비번 불일치
      $("#loginBtn").on("click", function () {
        let id = $("#mid").val();
        let pw = $("#mpw").val();

        $.ajax({
          url: "login.do",
          type: "post",
          data: {
            mid: id,
            mpw: pw,
          },

          success: function (result) {
            if (result.retCode == "Success") {
              if (result.manager == "admin") {
                location.href = "productManagerPage.do";
              } else {
                location.href = "main.do";
              }
            } else if (result.retCode == "Fail") {
              $("#errorMsg").text("아이디와 비밀번호를 정확히 입력해 주세요");
              $("#errorMsg").css("color", "red");

              $("#mid").val("");
              $("#mpw").val("");
            }
          },

          error: function () {
            console.log("실패");
          },
        });
      });

      // 로그인 할 때, 버튼 누르는 거 대신 엔터 키 입력만으로도 가능하게 함.
      $(".login-wrapper").on("keypress", function (e) {
        if (e.keyCode == "13") {
          $("#loginBtn").click();
        }
      });
    </script>
  </body>
</html>

