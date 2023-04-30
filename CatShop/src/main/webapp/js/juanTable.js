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

    //삭제버튼 누르면 체크된거만 삭제
    function delNotice() {
      var chks = document.getElementsByName("cbox");
      var chkst = [];
      for (let i = 0; i < chks.length; i++) {
        if (chks[i].checked == true) {
          chkst.push(chks[i].closest("tr").children[1].innerText);
        }
      }
      console.log(chkst);
      $.ajax({
        url: "noticeDelete.do",
        type: "post",
        traditional: true, // ajax 배열 넘기기 옵션!
        data: { arrStr: chkst },
        dataType: "json",
        success: function (result) {
          //일로 안와서 밑에서 reload함
        },
        error: function (reject) {
          location.reload();
        },
      });
    }

    //관리자만 작성삭제 보이게
    if ("${auth}" !== "admin") {
      let buttons = document.querySelectorAll(".admin");
      //속성 값 설정
      for (let i = 0; i < buttons.length; i++) {
        buttons[i].setAttribute("hidden", true);
      }
    }
  