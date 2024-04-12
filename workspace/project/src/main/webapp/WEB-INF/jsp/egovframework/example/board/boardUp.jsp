<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>게시글 수정</title>
    </head>
    <body>
        <!-- Responsive navbar-->
        <jsp:include page="header.jsp"></jsp:include>

        <div class="container mb-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-10" style="margin: 0 auto;">
                        <header class="mb-4 mt-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1"><span id="titleVar">|</span>게시글 수정</h1>
                        </header>
                        <form:form modelAttribute="vo" id="updateForm" name="updateForm">
                            <form:input type="text" path="board_idx" class="form-control" id="board_idx" placeholder="제목 입력" value="${upBoardInfo.board_idx}" style="display: none;" name="selectedId"/>
                            <div class="form-group">
                                <label for="title">제목</label>
                                <form:input type="text" path="title" class="form-control" id="title" placeholder="제목 입력" value="${upBoardInfo.title}" maxlength="50" />
                                &nbsp;<form:errors path="title" />
                            </div>
                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <form:input type="text" path="writer" class="form-control" id="writer" maxlength="30" placeholder="작성자 입력" value="${upBoardInfo.writer}" disabled="true" maxlength="200" />
                                &nbsp;<form:errors path="writer" />
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <input type="text" value="${upBoardInfo.content}" style="display: none;" id="contentResponse">
                                <form:textarea type="text" path="content" class="form-control" id="content" placeholder="내용 입력" rows="10" />
                                &nbsp;<form:errors path="content" />
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="button" id="backBnt" class="btn btn-secondary mr-3 btn-lg">뒤로가기</button>
                                <button type="button" class="btn btn-primary btn-lg" id="boardUpBnt">수정</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>