<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
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

.pagingBtn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: var(- -button-bg-color);
	color: var(- -button-color);
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
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}
</style>
<main>
	<div class="container-fluid px-4">
		<div id="pageName">
			<h1>회원관리페이지</h1>
		</div>
		<div>
			<form action="#" method="POST" id="search-btn-group">
				<label for="search-input"></label> <input type="text"
					id="search-input" name="search-input" class="search-input"
					placeholder="아이디를 입력하세요">
				<button type="button" class="search-btn">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<div id="line" class="card mb-4"></div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 회원 검색 결과
			</div>
			<div class="card-body">
				<table id="datatablesSimple" class="table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>연락처</th>
							<th>이메일</th>
							<th>권한</th>
							<th>수정</th>
							<th>삭제</th>
							<!-- <th colspan="2" style="text-align: center">삭제</th> -->
						</tr>
					</thead>
					<tbody id="list"></tbody>
				</table>
				<div id="paging" style="text-align: left;"></div>
			</div>
		</div>
	</div>
</main>



<script>
	  $(document).ready(function() {
		  getMemberListList(1);
	  });
	  var page = 1;
	  
	  function getMemberListList(page) {
		  $.ajax({
			url: 'memberList.do',
		    data: { page: page },
		    success: function (result) {
		      console.log(result.paging);
		      $(result.memberList).each(function (idx, item) { //인덱스, 인덱스에 들어있는 값
					$('#list').append(makeRow(item)); //화면출력
			  });
		      $(result.memberList).each(function (idx, item) { //인덱스, 인덱스에 들어있는 값
					$('#list').append(makeRowUpd(item)); //화면출력
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
		  $('#list').empty();
		  $('#paging').empty();
		  getMemberListList(page);
	  }
	  //페이지네이션 제작
	  function createPageLink(page, text) {
	  return $('<a>').click(movePage)
	      .attr('class', 'pagingBtn')
    		.attr('style', 'float:left;')
	  				 .data('page',page)
	  			  	 .text(text);
	  }
	
	


	/////////////////////////////////////////////////////////////////////

	function searchMember() {
		let memId = $('#search-input').val();
		console.log('출력 테스트 - jsp 파일 -> ' + memId);

		$.ajax({
			url: "searchMemberManage.do",
			data: { memId: memId },
			success: function (result) {
				$('#search-input').val("");
				$("#list").find("tr").remove();

				console.log(result);
				$(result).each(function (idx, item) {
					$('#list').append(makeRow(item));
				});

				$(result).each(function (idx, item) {
					$('#list').append(makeRowUpd(item));
				});
			},
			error: function (reject) {
				console.log(reject);
			}
		})
	}

	// 검색 버튼 눌렀을 시, searchMember() 실행
	$('.search-btn').click(function (e) {
		searchMember();
	});


	// 검색 버튼 안 누르고, 그냥 아이디 검색 후 엔터 눌렀을 때도, searchMember() 실행
	$('#search-input').keypress(function (event) {
		if (event.which == 13) {
			searchMember();
			return false;
		}
	});


	// $('#search-input').keypress(function (event) {
	// 	if (event.which == 13) {
	// 		$('.search-btn').click();
	// 		return false;
	// 	}
	// });

	// .search-btn
	/* 	$('.search-btn').click( function(e) {
			let memId = $('#search-input').val();
			console.log('출력 테스트 - jsp 파일 -> ' + memId);
	
			$.ajax({
				url : "searchMemberManage.do",
				data : {memId : memId},
				success : function(result) {
					console.log(result);
	
					$('#search-input').val("");
					$("#list").find("tr").remove();
					$(result).each(function(idx, item) {
						$("#list").append(makeRow(item));
					});
					$(result).each(function(idx, item) {
						$("#list").append(makeRowUpd(item));
					});
				},
				error : function(reject) {
					console.log(reject);
				}
			})		
		}) */

	/////////////////////////////////////////////////////////////////////
	//목록출력 함수  (더블 클릭시, 수정 인풋으로 바뀜)
	function makeRow(member = {}) {
		let tr = $("<tr />");

		tr.append(
			$('<td />').text(member.memId), //innerText
			$('<td />').text(member.memPw),
			$('<td />').text(member.memName),
			$('<td />').text(member.memPhone),
			$('<td />').text(member.memEmail),
			$('<td />').text(member.memUser), //콜백함수 : 클릭이라는 이벤트가 발생해야 된다 뒤에()를 붙히면 클릭하기도 전에 실행된다
			$("<td />").append(
				$("<button />")
					.addClass("btn btn-success updbtn")
					.text("수정")
					.attr("memIdUpd", member.memId)
			),
			$('<td />').append( //td 추가
				$('<button class="btn btn-danger">삭제</button>')
					.attr('memIdDel', member.memId) // .attr => setAttribute, 만들다
					.on('click', deleteMemberFnc) //이벤트
			)
		);

		return tr;
	}


	function makeRowUpd(manager = {}) {
		let tr = $("<tr />");

		$(".updbtn").on("click", function (e) {
			let id = $(this).closest("tr").children().eq(0).text();
			let password = $(this).closest("tr").children().eq(1).text();
			let name = $(this).closest("tr").children().eq(2).text();
			let phone = $(this).closest("tr").children().eq(3).text();
			let email = $(this).closest("tr").children().eq(4).text();
			let user = $(this).closest("tr").children().eq(5).text();

			let nTr = $("<tr />").append(
				$("<td />").append($("<input id='id' />").val(id)),
				$("<td />").append($("<input id='password' />").val(password)),
				$("<td />").append($("<input id='name' />").val(name)),
				$("<td />").append($("<input id='phone' />").val(phone)),
				$("<td />").append($("<input id='email' />").val(email)),
				$("<td />").append($("<input id='user' />").val(user)),
				$("<td />").append(
					$(
						"<button onclick='updateMemberFnc(event)' class='btn btn-success updbtn'>수정 완료</button>"
					)
				)
			);
			$(this).closest("tr").replaceWith(nTr);
		});

		return tr;
	}


	function deleteMemberFnc(e) {
		//안내메세지
		if (!window.confirm("삭제하시겠습니까?")) {
			//아니요 누르면 멈춘다
			return;
		}

		let memId = $(e.target).attr('memIdDel'); // .attr => getAttribute, 가져오다

		$.ajax({
			url: 'removeMember.do',	//회원 삭제하는 url 및 컨트롤 등록하기
			data: { memId: memId },		//removeMember.do?id=user
			success: function (result) {
				console.log(result);
				if (result.retCode == 'Success') {
					alert("삭제완료");
					$(e.target).parent().parent().remove();
				} else {
					alert("삭제오류!!");
				}
			},
			error: function (reject, code, err) {
				console.log(reject);
				console.log(code);
			}
		});
	} // end of deleteFnc


	function updateMemberFnc(e) {
		let tr = $(e.target).parent().parent(); //tr

		let id = $("#id").val();
		let password = $("#password").val();
		let name = $("#name").val();
		let phone = $("#phone").val();
		let email = $("#email").val();
		let user = $("#user").val();

		console.log('jsp 파일에서 값 찍히는지 확인 => ' + id + ', ' + password + ', ' + name + ', ' + phone + ', ' + email + ', ' + user);


		$.ajax({
			url: 'updateMember.do',
			method: 'post',
			data: {
				memId: id,
				memPw: password,
				memName: name,
				memPhone: phone,
				memEmail: email,
				memUser: user
			},
			success: function (result) {
				console.log(result);
				if (result.retCode == 'Success') {
					console.log(result.manager);
					tr.replaceWith(makeRow(result.member));
					tr.replaceWith(makeRowUpd(result.member));
				} else {
					alert("입력 미완");
				}
			},
			error: function (err) {
				console.log(err);
			}
		})
	} //end of updateMemberFnc


	/* //수정버튼
	function updateMemberFnc(e) {
		let tr = $(e.target).parent().parent(); //tr
	
		let id = $("#id").val();
		let password = $("#password").val();
		let name = $("#name").val();
		let phone = $("#phone").val();
		let email = $("#email").val();
		let user = $("#user").val();
	
		let formData = new FormData();
		formData.append("id", id);
		formData.append("password", password);
		formData.append("name", name);
		formData.append("phone", phone);
		formData.append("email", email);
		formData.append("user", user);
	
	
		$.ajax({
			url: 'updateMember.do',
			method: 'post',
			data: formData,
			contentType: false,
			processData: false,
			success: function (result) {
				console.log(result);
				if (result.retCode == 'Success') {
					tr.replaceWith(makeRow(result.member));
					// tr.replaceWith(makeRowUpd(result.member));
				} else {
					alert("입력 미완");
				}
			},
			error: function (err) {
				console.log(err);
			}
		})
	} //end of updateMemberFnc */
</script>