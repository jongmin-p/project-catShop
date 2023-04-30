// 아이디 중복확인
$("#member_id").blur(function () {
    // id = "id_reg" / name = "userId"
    let member_id = $("#member_id").val();

    $.ajax({
        url: "idCheck.do",
        type: "post",
        data: { id: member_id },
        success: function (result) {
            console.log("1 = 중복o / 0 = 중복x : " + result);

            if (result.retCode == "Success") {
                // 1 : 아이디가 중복되는 문구
                $("#id_check").text("사용중인 아이디입니다 :p");
                $("#id_check").css("color", "red");
                $("#reg_submit").attr("disabled", true);
            } else if(result.retCode == "Fail") {

                $("#id_check").text("사용 가능한 아이디입니다 :p");
                $("#id_check").css("color", "green");

                } else if (member_id == "") {
                    $("#id_check").text("아이디를 입력해주세요 :)");
                    $("#id_check").css("color", "red");
                    $("#reg_submit").attr("disabled", true);
                }
            },
        error: function () {
            console.log("실패");
        },
    });
});
