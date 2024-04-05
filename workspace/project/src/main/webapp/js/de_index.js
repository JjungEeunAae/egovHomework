/* 전체 목록 페이지으로 이동 */
$("#listRedirect").click(() => {
    window.location.href = "list.do";
});

/* 수정 페이지로 이동 */
$("#upRedirect").click(() => {
    const boardIdx = $("#boardDetail").attr("name");
    window.location.href = "up.do?idx=" + boardIdx;
});

/* 게시글 삭제 */
$("#delRedirect").click(() => {
    console.log("delRedirect");
});