const urlParams = new URLSearchParams(window.location.search);

/* pagination 페이지 링크 function */
function fn_link_page(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "/project/list.do";
    document.listForm.submit();
}

/* 글 수정 화면 function */
function fn_select(idx) {
    document.listForm.idx.value = idx;
    document.listForm.action = "/project/detail.do" ;
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
            document.listForm.idx.value = boardInsertIdx;
            document.listForm.action = "/project/detail.do" ;
            document.listForm.submit();
        };
    });
};
detailRedirectBnt();

/* 검색할 때 '전체'로 맞췄을 시 input 값을 비우는 함수*/
$("#searchItem").change(() => {
    if ($("#searchItem").val() === "") {
        $("#searchContent").val(""); // 검색 입력(input) 내용을 지웁니다.
    }
});

const search = () => {
    // const currentUrl = window.location.href;
    // let updatedUrl = "";
    // const searchItem = $("#searchItem").val();
    // const searchKeyword = $("#searchContent").val();
    // let newParam = "searchCondition=" + searchItem + "&searchKeyword" + searchKeyword;
    $("#searchBtn").click(() => {
        console.log($("#searchItem").val());
        if($("#searchItem").val() === "1" || $("#searchItem").val() === "2") {
            if($("#searchContent").val() === "" || $("#searchContent").val().trim() === "") {
                Swal.fire({
                    title: "알림",
                    text: "검색할 키워드를 작성해주세요.",
                    icon: "warning"
                });
            } else {
                document.searchForm.action = "/project/list.do";
                document.searchForm.submit();
            };
        } else {
            document.searchForm.action = "/project/list.do";
            document.searchForm.submit();
        };
    });
}
search();