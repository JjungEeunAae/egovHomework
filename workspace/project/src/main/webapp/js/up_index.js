$("#content").val($("#contentResponse").val());

/* 뒤로가기 */
$("#backBnt").click(() => {
    history.back();
});

/* 수정 처리 */
$("#boardUpBnt").click(() => {
    frm = document.detailForm;
    frm.action = "/project/boardUp.do";
    frm.submit();
});