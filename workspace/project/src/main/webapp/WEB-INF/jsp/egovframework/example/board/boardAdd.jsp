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
            <title>Sample <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
            </title>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

            <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
            <validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
                            <h1 class="fw-bolder mb-1"><span id="titleVar">|</span>게시글 등록</h1>
                            <!-- Post categories-->
                        </header>
                        <form:form modelAttribute="vo" id="detailForm" name="detailForm">
                            <div class="form-group">
                                <label for="title">제목</label>
                                <input type="text" class="form-control" id="title" placeholder="제목 입력">
                            </div>
                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <input type="text" class="form-control" id="writer" placeholder="작성자 입력">
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <textarea type="text" class="form-control" id="content" placeholder="내용 입력" rows="10"></textarea>
                            </div>
                            <div class="d-flex justify-content-end">
                                <a href="/project/list.do" role="button" class="btn btn-secondary mr-3 btn-lg">취소</a>
                                <button type="button" class="btn btn-primary btn-lg" id="boardSave">등록</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javaScript" language="javascript" defer="defer">
            /* 글 등록 function */
            $('#boardSave').click(() => {
                frm = document.detailForm;
                // if(!validateSampleVO(frm)){
                //     return;
                // }else{
                    frm.action = "/project/boardAdd.do";
                    frm.submit();
                // }
            });
        </script>
    </body>
</html>