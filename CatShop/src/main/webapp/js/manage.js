/**
 * manage.js
 */
console.log("manage.js start.....!!!");

//document 즉 html??을 다 읽고나서 실행(실행시점)

$(document).ready(function () {
    //목록을 가져오는 Ajax 호출
    console.log($('#list'));

    $.ajax({
        url: 'memberList.do',
        success: function (result) {
            //제이쿼리 forEach 
            $(result).each(function (idx, item) { //인덱스, 인덱스에 들어있는 값
                $('#list').append(makeRow(item)); //화면출력
            });

            $(result).each(function (idx, item) { //인덱스, 인덱스에 들어있는 값
                $('#list').append(makeRowUpd(item)); //화면출력
            });
        },

        error: function (reject) {
            console.log(reject);
        }
    });


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
                $('<button class="btn btn-danger">삭제22</button>')
                    .attr('member_id', member.memId) // .attr => setAttribute, 만들다
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










    //     //등록버튼 이벤트
    //     $('#addBtn').on('click', function () {
    //         let id = $('#member_id').val(); // .val() : element.value 속성을 읽어옴
    //         let name = $('#member_name').val();
    //         let phone = $('#member_phone').val();
    //         let email = $('#member_email').val();
    //         let user = $('#member_user').val();

    //         let formData = new FormData();
    //         formData.append('id', id);
    //         formData.append('name', name);
    //         formData.append('phone', phone);
    //         formData.append('email', email);
    //         formData.append('user', user);

    //         $.ajax({
    //             url: 'addMember.do',
    //             method: 'post',
    //             data: formData,
    //             contentType: false,
    //             processData: false,
    //             success: function (result) {
    //                 // 처리된 정보를 화면에 생성
    //                 console.log(result);
    //                 if (result.retCode == 'Success') {
    //                     $('#list').append(makeRow(result.member));
    //                 } else {
    //                     alert("입력 미완");
    //                 }
    //             },
    //             error: function (err) {
    //                 //alert("실패");
    //                 console.log(err);
    //             }
    //         })
    //     });
    // });

    function deleteMemberFnc(e) {
        //안내메세지
        if (!window.confirm("삭제하시겠습니까?")) {
            //아니요 누르면 멈춘다
            return;
        }

        let memberId = $(e.target).attr('member_id'); // .attr => getAttribute, 가져오다

        $.ajax({
            url: 'removeMember.do',	//회원 삭제하는 url 및 컨트롤 등록하기
            data: { id: memberId },		//removeMember.do?id=user
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








    //수정버튼
    function updateMemberFnc(e) {
        let tr = $(e.target).parent().parent(); //tr

        let id = tr.children().eq(0).text();
        let password = tr.find('td:nth-of-type(2) input').val();
        let name = tr.find('td:nth-of-type(3) input').val();
        let phone = tr.find('td:nth-of-type(4) input').val();
        let email = tr.find('td:nth-of-type(5) input').val();
        let user = tr.find('td:nth-of-type(6) input').val();

        $.ajax({
            url: 'updateMember.do',
            method: 'post',
            data: {
                id: id,
                password: password,             // 여기 key 값이랑  MemberUpdate.java 의 getParameter 랑 통일
                name: name,
                phone: phone,
                email: email,
                user: user
            },
            success: function (result) {
                console.log(result);
                if (result.retCode == 'Success') {
                    tr.replaceWith(makeRow(result.member));
                } else {
                    alert("입력 미완");
                }
            },
            error: function (err) {
                console.log(err);
            }
        })
    } //end of updateMemberFnc
})