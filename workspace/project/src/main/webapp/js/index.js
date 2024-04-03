/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "/project/list.do";
    document.listForm.submit();
}


/* 글 수정 화면 function */
function fn_egov_select(idx) {
    document.listForm.selectedId.value = idx;
    document.listForm.action = "/project/detail.do" ;
    document.listForm.submit();
}


/* 글 목록 화면 function */
function fn_egov_selectList() {
    // document.listForm.action = "<c:url value='/list.do'/>";
    document.listForm.action = "/project/list.do";
    document.listForm.submit();
}