<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8" />
    <meta name="viewport" content="width=device-width", initial-scale"="1">
    <link rel="stylesheet" href="css/bootstrap.css" />
    <title>JSP 게시판 웹 사이트</title>
    <style>
      .admin {
        background-color: white;
        border: solid 1px rgba(128, 128, 128, 0.479);
        border-radius: 4px;
        height: 35px;
        width: 55px;
        margin-right: 5px;
      }
      .admin:hover {
        background-color: rgba(128, 128, 128, 0.171);
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <table
          class="table table-striped"
          style="text-align: center; border: 1px solid #dddddd"
        >
          <thead>
            <tr>
              <th
                colspan="3"
                style="background-color: #eeeeee; text-align: center"
              >
                공지사항&nbsp;&nbsp;<font size="2em">${list.notId }</font>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="width: 20%"><b>제목</b></td>
              <td colspan="2">${list.notTitle }</td>
            </tr>
            <tr>
              <td><b>작성자</b></td>
              <td colspan="2">관리자</td>
            </tr>
            <tr>
              <td><b>작성일자</b></td>
              <td colspan="2">${list.notDate }</td>
            </tr>
            <tr>
              <td><b>내용</b></td>
              <td colspan="2" style="min-height: 200px; text-align: left">
                ${list.notContent }
              </td>
            </tr>
          </tbody>
        </table>
        <button class="admin" onclick="location.href = 'noticeList.do'">
          목록
        </button>
        <button
          class="admin"
          onclick="location.href = 'noticeUpdateForm.do?notId=${list.notId }'"
        >
          수정
        </button>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
  //관리자만 작성삭제 보이게
    if ("${auth}" !== "admin") {
      let buttons = document.querySelectorAll(".admin");
      //속성 값 설정
      for (let i = 0; i < buttons.length; i++) {
        buttons[i].setAttribute("hidden", true);
      }
    }
    </script>
  </body>
</html>
