const boardIdx = $("#boardDetail").attr("name");

/* 전체 목록 페이지으로 이동 */
$("#listRedirect").click(() => {
    window.location.href = "list.do";
});

/* 수정 페이지로 이동 */
$("#upRedirect").click(() => {
    window.location.href = "up.do?idx=" + boardIdx;
});

$("#delRedirect").click(() => {
    if(boardIdx != 0 || boardIdx != null) {
        alert("게시글 삭제가 완료되었습니다.");
    }
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
})