$("#content").val($("#contentResponse").val());

/* 뒤로가기 */
$("#backBnt").click(() => {
    history.back();
});

/* 수정 처리 */
$("#boardUpBnt").click(() => {
    Swal.fire({
        title: "수정 확인 알림",
        text: "게시글을 수정 하시겠습니까?",
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "확인",
        cancelButtonText: "취소"
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: "수정완료",
                text: "게시글이 수정되었습니다.",
                icon: "success"
            }).then((okResult) => {
                if(okResult.isConfirmed) {
                    let frm = document.updateForm;
                    frm.action = "/project/boardUp.do";
                    frm.submit();
                }
            });
        };
    });
});