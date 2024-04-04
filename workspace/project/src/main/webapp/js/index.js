/* pagination 페이지 링크 function */
function fn_link_page(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "/project/list.do";
    document.listForm.submit();
}

/* 글 수정 화면 function */
function fn_select(idx) {
    document.listForm.selectedId.value = idx;
    document.listForm.action = "/project/detail.do" ;
    document.listForm.submit();
}

/* 글 목록 화면 function */
function fn_selectList() {
    // document.listForm.action = "<c:url value='/list.do'/>";
    document.listForm.action = "/project/list.do";
    document.listForm.submit();
}

/* 글 등록 화면 function */
function fn_addView() {
    document.listForm.action = "/project/add.do";
    document.listForm.submit();
}