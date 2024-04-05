const urlParams = new URLSearchParams(window.location.search);

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
};

/* 글 목록 화면 function */
function fn_selectList() {
    // document.listForm.action = "<c:url value='/list.do'/>";
    document.listForm.action = "/project/list.do";
    document.listForm.submit();
};

/* 글 등록 화면 function */
function fn_addView() {
    document.listForm.action = "/project/add.do";
    document.listForm.submit();
};

/* 글 등록 완료 모달 */
const path = () => {
    if(urlParams.get("result") == "true") {
        $("#modalBnt").click();
    };
};
path();
/* 모달 - 바로가기 버튼 (등록된 글 조회 버튼) */
const detailRedirectBnt = () => {
    $("#detailRedirectBnt").click(() => {
        const boardInsertIdx = urlParams.get("idx");
        const boardIdx = $("#boardIdx_" + boardInsertIdx).attr("name");
        if(boardIdx == boardInsertIdx) {
            document.listForm.selectedId.value = boardInsertIdx;
            document.listForm.action = "/project/detail.do" ;
            document.listForm.submit();
        };
    });
};
detailRedirectBnt();
