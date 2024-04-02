const boardListRender = $("#boardListRender");

const boardListAJAX = () => {
    let data = {
        searchCondition : $("#searchItem").val(),
        searchKeyword : $("#searchContent").val()
    };

    $.ajax({
        url: "board",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function(response) {
            // AJAX 요청이 성공한 경우 여기에 응답 처리 코드를 작성합니다.
            console.log("Response:", response);
        },
        error: function(error) {
            // AJAX 요청이 실패한 경우 여기에 오류 처리 코드를 작성합니다.
            console.error("Error:", error);
        }
    });
};

boardListAJAX();

const boardListSearch = () => {
    $("#searchBtn").click(() => {
        boardListAJAX();
    })
};

boardListSearch();