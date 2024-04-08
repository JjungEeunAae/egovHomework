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
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
            <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
            <script src="js/up_index.js" language="javascript" defer="defer"></script>
            <validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>
            <link rel="stylesheet" href="css/up_index.css">
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
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
                                <form:input type="text" path="title" class="form-control" id="title" placeholder="제목 입력" value="${upBoardInfo.title}" />
                                &nbsp;<form:errors path="title" />
                            </div>
                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <form:input type="text" path="writer" class="form-control" id="writer" maxlength="30" placeholder="작성자 입력" value="${upBoardInfo.writer}" disabled="true" />
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
    </body>
</html>