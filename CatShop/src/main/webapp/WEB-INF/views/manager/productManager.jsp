<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

table {
	border-collapse: separate;
	border-spacing: 0;
	width: 100%;
	padding: 30px 30px;
}

th, td {
	padding: 6px 15px;
}

th {
	background: #42444e;
	color: #fff;
	text-align: left;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

#addProduct {
	float: right;
	margin-right: 30px;
}

td.image_container img {
	height: 100px;
	width: 100px;
}
</style>
<input type="file" id="fileUpload" accept="images/*"
	style="display: none" onchange="setThumbnail(event);" />

<table>
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
<br />
<button id="addProduct" class="btn btn-primary"
	onclick="location.href = 'productManagerAddPage.do'">등록</button>
<script>
  $.ajax({
    url: "productManagerList.do",
    success: function (result) {
      $(result).each(function (idx, item) {
        $("#productList").append(makeRow(item));
      });

      $(result).each(function (idx, item) {
        $("#productList").append(makeRowUpd(item));
      });
    },
    error: function (reject) {
      console.log(reject);
    },
  });
  
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

    // 		$(".updbtn").on("click", function (e) {
    // 			console.log(e.target)
    // 			let pid = $(this).closest('tr').children().eq(0).text();
    // 		    let pimg = $(this).closest('tr').children().eq(1).children().attr("src")
    // 		    let pname = $(this).closest('tr').children().eq(2).text();
    // 		    let pprice = $(this).closest('tr').children().eq(3).text();
    // 		    let pdesc = $(this).closest('tr').children().eq(4).text();
    // 		    let pcategory = $(this).closest('tr').children().eq(5).text();

    // 			let nTr = $("<tr />").append(
    // 				$("<td />").append($("<input id='pid' />").val(pid)),
    // 				$("<td />").append(
    // 						$('<img>', {
    // 							'src' : pimg,
    // 							'width' : '100px',
    // 							'height' : '100px',
    // 							'id' : 'proImg'
    // 						})
    // 					),
    // 				$("<td />").append($("<input id='pname' />").val(pname)),
    // 				$("<td />").append($("<input id='pprice' />").val(pprice)),
    // 				$("<td />").append($("<input id='pdesc' />").val(pdesc)),
    // 				$("<td />").append($("<input id='pcategory' />").val(pcategory)),
    // 				$("<td />").append(
    // 				        $(
    // 				          "<button onclick='updateProductFnc(event)' class='btn btn-success updbtn'>수정 완료</button>"
    // 				        )
    // 				      )
    // 			)
    // 			$(this).closest('tr').replaceWith(nTr);
    // 		})

    return tr;
  }

  function makeRowUpd(manager = {}) {
    let tr = $("<tr />");

    $(".updbtn").on("click", function (e) {
      console.log(e.target);
      let pid = $(this).closest("tr").children().eq(0).text();
      let pimg = $(this).closest("tr").children().eq(1).children().attr("src");
      let pname = $(this).closest("tr").children().eq(2).text();
      let pprice = $(this).closest("tr").children().eq(3).text();
      let pdesc = $(this).closest("tr").children().eq(4).text();
      let pcategory = $(this).closest("tr").children().eq(5).text();

      let nTr = $("<tr />").append(
        $("<td />").append($("<input id='pid' />").val(pid)),
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
        $("<td />").append($("<input id='pprice' />").val(pprice)),
        $("<td />").append($("<input id='pdesc' />").val(pdesc)),
        $("<td />").append($("<input id='pcategory' />").val(pcategory)),
        $("<td />").append(
          $(
            "<button onclick='updateProductFnc(event)' class='btn btn-success updbtn'>수정 완료</button>"
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
