const boardIdx = $("#boardDetail").attr("name");
const urlParam = new URLSearchParams(window.location.search);

/* 전체 목록 페이지으로 이동 */
$("#listRedirect").click(() => {
    window.location.href = "list.do";
});

/* 수정 페이지로 이동 */
$("#upRedirect").click(() => {
    window.location.href = "up.do?idx=" + boardIdx;
});

/* 게시글 삭제 */
$("#delRedirect").click(() => {
    if(boardIdx != 0 || boardIdx != null) {
        Swal.fire({
            title: "삭제 확인 알림",
            text: "게시글을 삭제 하시겠습니까?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "확인",
            cancelButtonText: "취소"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "삭제 완료",
                    text: "게시글이 삭제되었습니다.",
                    icon: "success"
                }).then((okResult) => {
                    if(okResult.isConfirmed) {
                        let frm = document.deleteForm;
                        frm.submit();
                    };
                });
            };
        });
    };
});

/* 좋아요 */
$("#likeCount").click(() => {
    let currentSrc = $("#likeCount").attr("src");
    if (currentSrc === "images/egovframework/likeCount/thumb-up_14989232.png") {
        $("#likeCount").attr("src", "images/egovframework/likeCount/thumb-up_14989292.png");
        $("#likeCnt").text(1);
    } else if (currentSrc === "images/egovframework/likeCount/thumb-up_14989292.png") {
        $("#likeCount").attr("src", "images/egovframework/likeCount/thumb-up_14989232.png");
        $("#likeCnt").text(0);
    }
});

/* 부모 댓글 등록 */
$("#replySaveBnt").click(() => {
    const writer = $("#replyWriter");
    const content = $("#replyContent");
    
    if(writer.val() === "" || writer.val().trim() == "") {
        swalBasic("확인 필요", "작성자를 입력하세요.", "warning", writer);
    } else if(content.val() === "" || content.val().trim() == "") {
        swalBasic("확인 필요", "댓글 내용을 입력하세요.", "warning", content);
    } else {
        let frm = document.replyAddForm;
        frm.action = "/project/replyAdd.do";
        frm.submit();
    }
});

/* sweetalert2 - 댓글 등록 확인 */
const replySaveResultSwal = () => {
    if(urlParam.get("save") == "true") {
        swalBasic("등록 완료", "댓글 등록이 완료되었습니다.", "success");
    };
};

/* sweetalert2 basic function */
const swalBasic = (title, text, icon, target = null) => {
    Swal.fire({
        title: title,
        text: text,
        icon: icon
    }).then((result) => {
        if(result.isConfirmed && target !== null) {
            target.focus();
        };
    });
};
replySaveResultSwal();