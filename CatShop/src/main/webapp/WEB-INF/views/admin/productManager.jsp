<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
td.image_container img {
	height: 100px;
	width: 100px;
}

table:nth-of-type(2) input {
	width: 100px;
	display: inline-block;
}

/* 버튼 스타일링 */
.search-btn {
	background-color: #4caf50;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 10px;
	cursor: pointer;
}

/* 입력창 스타일링 */
.search-input {
	padding: 10px;
	font-size: 16px;
	border: 2px solid #ccc;
	border-radius: 5px;
	vertical-align: middle;
}

#search-btn-group {
	margin-top: 10px;
	margin-right: 20px;
	margin-bottom: 20px;
	float: right;
}

#pageName {
	margin-top: 10px;
	float: left;
}

#line {
	clear: both;
}
#datatablesSimple1 tr th {
	width: 100px;
}
.input-group {
	margin: 0px !important;
}
.space {
	margin-right : 7px !important;
}
.pagingBtn { 
  -webkit-appearance: none; 
  -moz-appearance: none; 
  appearance: none; 
  
  background: var(--button-bg-color); 
  color: var(--button-color);
  
  margin: 0; 
  padding: 0.5rem 1rem; 
  
   font-family: 'Noto Sans KR', sans-serif; 
   font-size: 1rem; 
  font-weight: 400;
   text-align: center; 
   text-decoration: none; 
  
  border: none; 
  border-radius: 4px; 
  
   display: inline-block; 
   width: auto; 
  
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); 
  
   cursor: pointer; 
  
   transition: 0.5s; 
 }
</style>
<main>
	<div class="container-fluid px-4">
		<div id="pageName">
			<h1>상품관리페이지</h1>
		</div>

		<div id="line" class="card mb-4"></div>
		<div>
			<div class="card mb-4">
				<table id="datatablesSimple1" class="table table-border">
					<tr>
						<th style="padding-top: 15px;">상품번호</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<input type="text" class="form-control proinput"
									aria-label="Text input with dropdown button" id="proIdBtn">
							</div>
						</td>
					</tr>
					<tr>
						<th style="padding-top: 15px;">상품이름</th>
						<td colspan=5>
							<div class="input-group mb-3">
								<input type="text" class="form-control proinput"
									aria-label="Text input with dropdown button" id="proNameBtn">
							</div>
						</td>

					</tr>
				</table>
				<div style="text-align: center; margin-bottom: 20px">
					<button type="button" class="btn btn-primary btn-lg" id="searchBtn">검색</button>
					<button type="reset" class="btn btn-secondary btn-lg"
						>초기화</button>
				</div>
			</div>
		</div>
		<div id="line" class="card mb-4"></div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 상품 검색 결과
			</div>
			<div class="card-body">
				<input type="file" id="fileUpload" accept="images/*"
					style="display: none" onchange="setThumbnail(event);" />
				<table id="datatablesSimple" class="table">
					<thead>
						<tr>
							<th>제품_ID</th>
							<th>제품 이미지</th>
							<th>제품명</th>
							<th>제품 가격</th>
							<th>제품 설명</th>
							<th>제품 카테고리</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="productList"></tbody>
				</table>
				<div id="paging" style="text-align: left;"></div>
				<br />
				<button style="float:right" id="addProduct" class="btn btn-primary"
					onclick="location.href = 'productManagerAddPage.do'">등록</button>
			</div>
		</div>
	</div>
</main>

<script>
  $(document).ready(function() {
	  getProductManagerList(1);
  });
  var page = 1;
  
  function getProductManagerList(page) {
	  $.ajax({
	    url: "productManagerList.do",
	    data: { page: page },
	    success: function (result) {
	      console.log(result.paging);
	      $(result.productList).each(function (idx, item) {
	        $("#productList").append(makeRow(item));
	      });
	      $(result.productList).each(function (idx, item) {
	        $("#productList").append(makeRowUpd(item));
	      });
	      var beginPage = parseInt(result.paging.beginPage);
	      var endPage = parseInt(result.paging.endPage);
	      var currentPage = parseInt(result.paging.page);
	      console.log(beginPage);
	      console.log(endPage);
	      console.log(currentPage);
	      if(result.paging.prev) {
	        $('#paging').append($('<a>').click(movePage)
	        	    .attr('class', 'pagingBtn')
	        	    .attr('style', 'float:left;')
	                          .data('page',(beginPage-1))
	                          .text('prev'));
	      }
	      for (var i = beginPage; i <= endPage; i++) {
	        if (i === currentPage) {
	        	var link = createPageLink(i, i);
	          $('#paging').append(link);
	        } else {
	          var link = createPageLink(i, i);
	          $('#paging').append(link);
	        }
	      }
	      if(result.paging.next) {
	        $('#paging').append($('<a>').click(movePage)
	        	    .attr('class', 'pagingBtn')
	        	    .attr('style', 'float:left;')
	                          .data('page',(endPage+1))
	                          .text('next'));
	      }
	    },
	    error: function (reject) {
	      console.log(reject);
	    },
	  });
	}
  //페이지 이동
  function movePage() {
	  console.log(this)
	  page = $(this).data('page');
	  $('#productList').empty();
	  $('#paging').empty();
	  getProductManagerList(page);
  }
  //페이지네이션 제작 class="pagingBtn" style="float:left;"
function createPageLink(page, text) {
  return $('<button>').click(movePage)
    .attr('class', 'pagingBtn')
    .attr('style', 'float:left;')
    .data('page', page)
    .text(text);
}
  

  function searchProduct(page) {
    let proId = $('#proIdBtn').val();
    let proName = $('#proNameBtn').val();

    $('#paging').empty();
    console.log(page);
    $.ajax({
    	url : "searchProductManage.do",
	    data : {proId : proId, proName : proName, page: page},
	    success: function (result) {
	    	console.log(result)
	      $('#proIdBtn').val("");
          $('#proNameBtn').val("");
          $("#productList").find("tr").remove();
          $(result.searchReview).each(function(idx, item) {
        	  if (idx < 10) {
        	      $("#productList").append(makeRow(item));
        	  }
          });
          $(result.searchReview).each(function(idx, item) {
        	  if (idx < 10) {
              	$("#productList").append(makeRowUpd(item));
        	  }
          });
          
	      var beginPage = parseInt(result.paging.beginPage);
	      var endPage = parseInt(result.paging.endPage);
	      var currentPage = parseInt(result.paging.page);
	      console.log(beginPage);
	      console.log(endPage);
	      console.log(currentPage);
	      if(result.paging.prev) {
	        $('#paging').append($('<a>').click(moveSearchPage)
	                          .data('page',(beginPage-1))
	                          .text('prev'));
	      }
	      for (var i = beginPage; i <= endPage; i++) {
	        if (i === currentPage) {
	          $('#paging').append(i);
	        } else {
	          var link = createPageLink2(i, i);
	          $('#paging').append(link);
	        }
	      }
	      if(result.paging.next) {
	        $('#paging').append($('<a>').click(moveSearchPage)
	                          .data('page',(endPage+1))
	                          .text('next'));
	      }
	      $('#proIdBtn').val($('#pageName').data('proid'));
	      $('#proNameBtn').val($('#pageName').data('proname'));
	     
	    },
	    error: function (reject) {
	      console.log(reject);
	    },
	  });
    
  }
//검색페이지 이동
  function moveSearchPage() {
	  console.log(this)
	  page = $(this).data('page');
// 	  $('#productList').empty();
	  $('#paging').empty();
	  searchProduct(page);
  }
  //검색 페이지네이션 제작
  //페이지네이션 제작
  function createPageLink2(page, text) {
  return $('<a>').click(moveSearchPage)
  				 .data('page',page)
  			  	 .text(text);
  }
  
  

  $('input.proinput').keypress( function(e) {
    if (e.which === 13) {
        searchProduct();
      }
  });
  
  $('#searchBtn').click( function(e) {
	  if($('#proIdBtn').val() == '' && $('#proNameBtn').val() =='') {
		  alert('검색 조건을 확인하세요.')
		  return;
	  }
	  $('#pageName').data('proid',$('#proIdBtn').val());
      $('#pageName').data('proname',$('#proNameBtn').val());
	  	searchProduct();
	  	
  });
	
  $('#resetBtn').click( function(e) {
		
		$.ajax({
			url : "searchProductManage.do",
			data : {proId : "", proName : ""},
			success : function(result) {
				$("#productList").find("tr").remove();
				$(result).each(function(idx, item) {
					$("#productList").append(makeRow(item));
				});
				$(result).each(function(idx, item) {
					$("#productList").append(makeRowUpd(item));
				});
			},
			error : function(reject) {
				console.log(reject);
			}
		})		
	})
	
  function makeRow(manager = {}) {
    let tr = $("<tr />");

    tr.append(
      $("<td />").text(manager.proId),
      $("<td />").append(
        $("<img>", {
          src: "images/" + manager.proImg,
          width: "100px",
          height: "100px",
        })
      ),
      $("<td />").text(manager.proName),
      $("<td />").text(manager.proPrice),
      $("<td />").text(manager.proDesc),
      $("<td />").text(manager.proCategory),
      $("<td />").append(
        $("<button />")
          .addClass("btn btn-success updbtn")
          .text("수정")
          .attr("proIdUpd", manager.proId)
      ),
      $("<td />").append(
        $('<button class="btn btn-danger">삭제</button>')
          .attr("proIdDel", manager.proId)
          .on("click", deleteProductFnc)
      )
    );

    return tr;
  }

  function makeRowUpd(manager = {}) {
    let tr = $("<tr />");

    $(".updbtn").on("click", function (e) {
      let pid = $(this).closest("tr").children().eq(0).text();
      let pimg = $(this).closest("tr").children().eq(1).children().attr("src");
      let pname = $(this).closest("tr").children().eq(2).text();
      let pprice = $(this).closest("tr").children().eq(3).text();
      let pdesc = $(this).closest("tr").children().eq(4).text();
      let pcategory = $(this).closest("tr").children().eq(5).text();

      let nTr = $("<tr />").append(
        $("<td />").append($("<input id='pid' style='width:50px';/>").val(pid)),
        $("<td class='image_container'/>").append(
          $("<img>", {
            src: pimg,
            width: "100px",
            height: "100px",
            id: "proImg",
            class: "image_container"
          })
        ),
        $("<td />").append($("<input id='pname' />").val(pname)),
        $("<td />").append($("<input id='pprice' style='width:70px';/>").val(pprice)),
        $("<td />").append($("<textarea rows='3' cols='100' id='pdesc'></textarea>").val(pdesc)),
        $("<td />").append($("<input id='pcategory' style='width:70px';/>").val(pcategory)),
        $("<td />").append(
          $(
            "<button onclick='updateProductFnc(event)' class='btn btn-success updbtn'>수정완료</button>"
          )
        )
      );
      $(this).closest("tr").replaceWith(nTr);
    });

    return tr;
  }

  function deleteProductFnc(e) {
    if (!window.confirm("삭제하시겠습니까?")) {
      return;
    }

    let proId = $(e.target).attr("proIdDel");
    console.log(proId);

    $.ajax({
      url: "removeProductManager.do",
      data: { proId: proId },
      success: function (result) {
        console.log(result);
        if (result.retCode == "Success") {
          $(e.target).parent().parent().remove();
        } else {
          alert("오류");
        }
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  function updateProductFnc(e) {
    let tr = $(e.target).parent().parent();

    let pid = $("#pid").val();
    let pimg = $("#fileUpload")[0].files[0];
    let pname = $("#pname").val();
    let pprice = $("#pprice").val();
    let pdesc = $("#pdesc").val();
    let pcategory = $("#pcategory").val();

    let formData = new FormData();
    formData.append("pid", pid);
    formData.append("pimg", pimg);
    formData.append("pname", pname);
    formData.append("pprice", pprice);
    formData.append("pdesc", pdesc);
    formData.append("pcategory", pcategory);

    $.ajax({
      url: "modifyProductManager.do",
      method: "post",
      data: formData,
      contentType: false,
      processData: false,
      success: function (result) {
        console.log(
          $(e.target)
            .closest("tr")
            .children()
            .eq(1)
            .children()
            .attr("src")
            .substring(7)
        );
        if (result.retCode == "Success") {
          console.log(result.manager.proImg);
          if (result.manager.proImg == "") {
            let ans = $(e.target)
              .closest("tr")
              .children()
              .eq(1)
              .children()
              .attr("src")
              .substring(7);
            result.manager.proImg = ans;
          }
          let reader = new FileReader();
          reader.onload = function (ev) {
            console.log(ev.target);
            $("#proImg").attr("src", ev.target.result);
          };
          if (typeof pimg != "undefined") {
            reader.readAsDataURL(pimg);
          }
          alert("수정완료");
          console.log(result.manager);
          tr.replaceWith(makeRow(result.manager));
          tr.replaceWith(makeRowUpd(result.manager));
        } else {
          alert("입력미완");
        }
      },
      error: function (reject) {
        console.log(reject);
      },
    });
  }

  $(this).on("click", function (e) {
    if (e.target.id == "proImg") {
      $("#fileUpload").click();
    }
  });

  function setThumbnail(event) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelectorAll("img.image_container")[0].remove();
        document.querySelectorAll("td.image_container")[0].appendChild(img);
      };

      reader.readAsDataURL(event.target.files[0]);
    }
</script>
