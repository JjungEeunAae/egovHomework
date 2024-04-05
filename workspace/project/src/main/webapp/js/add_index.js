/* 글 등록 버튼 클릭 이벤트 */
$("#boardSave").click(() => {
    frm = document.detailForm;
    frm.action = "/project/boardAdd.do";
    frm.submit();
});