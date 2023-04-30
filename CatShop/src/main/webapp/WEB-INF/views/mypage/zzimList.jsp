<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
  <style>
    .pImg{
      width: 80px;
      height: 60px;
    }
    th{
      text-align:center
    }
    td{
      text-align:center
    }
  </style>
</head>

    <div class="content">
      <div class="container">
        <h2 class="mb-5">찜목록</h2>

        <div class="table-responsive custom-table-responsive">
          <table class="table custom-table">
            <thead>
              <tr>
                <th scope="col">
                  <label class="control control--checkbox">
                    <input type="checkbox" id="cboxAll"
                    onclick="checkAll()"
                    name="cboxAll" class="js-check-all" />
                    <div class="control__indicator"></div>
                  </label>
                </th>

                <th scope="col">상품번호</th>
                <th scope="col">상품사진</th>
                <th scope="col">상품명</th>
                <th scope="col">금액</th>
                <th scope="col"><button class="btn btn-danger" onclick="delAllZzim()">선택삭제</button></th>
              </tr>
            </thead>
            
            <tbody>
            <c:forEach var="zzim" items="${list }">
              <tr scope="row">
                <th scope="row">
                  <label class="control control--checkbox">
                    <input type="checkbox" name="cbox"/>
                    <div class="control__indicator"></div>
                  </label>
                </th>
                <input type ="hidden" value=${zzim.zzimId }>
                <td>${zzim.proId }</td>
                <td><img class="pImg" src= "images/${zzim.proImg }"></td>
                <td>
                  ${zzim.proName }
                  <small class="d-block"
                    ></small
                  >
                </td>
                <td>${zzim.proPrice }</td>
                <td><button class="btn btn-danger" onclick="delZzim()">삭제</button></td>
              </tr>
              </c:forEach>
            </tbody>
            
          </table>
        </div>
      </div>
    </div>

  <script>
//체크박스
  function checkAll() {
    if ($("#cboxAll").is(":checked")) {
      $("input[name=cbox]").prop("checked", true);
    } else {
      $("input[name=cbox]").prop("checked", false);
    }
  }

  $(document).on("click", "input:checkbox[name=cbox]", function (e) {
    var chks = document.getElementsByName("cbox");
    var chksChecked = 0;

    for (var i = 0; i < chks.length; i++) {
      var cbox = chks[i];

      if (cbox.checked) {
        chksChecked++;
      }
    }

    if (chks.length == chksChecked) {
      $("#cboxAll").prop("checked", true);
    } else {
      $("#cboxAll").prop("checked", false);
    }
  });
  //선택 삭제
    function delAllZzim() {
    var chks = document.getElementsByName("cbox");
    var chkst = [];
    for (let i = 0; i < chks.length; i++) {
      if (chks[i].checked == true) {
        chkst.push(chks[i].closest("tr").children[1].value); //상품번호를 배열에 넣기
      }
    }
    //chkst에 zzimId 잘 담김
    $.ajax({
      url: "zzimDelete.do",
      type: "post",
      traditional: true, // ajax 배열 넘기기 옵션!
      data: { arrStr: chkst },
      dataType: "json",
      success: function (result) {
    	  for(let j = 0; j < chks.length; j++){
    		  if (chks[j].checked == true) {
    			  $(chks[j].closest("tr")).remove();
    		  }
    	  }
      },
      error: function (reject) {
    	  location.reload();
      },
    });
  }
  //단건삭제
  function delZzim(){
	  let btn = event.currentTarget;
	  let check = btn.closest("tr").children[0].children[0].children[0]
	 console.log(check)
	 $(check).prop("checked", true)
	 delAllZzim();
  }
  </script>
    

    
  