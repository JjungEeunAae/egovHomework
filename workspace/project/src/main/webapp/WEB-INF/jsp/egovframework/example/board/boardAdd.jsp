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
        <title>게시글 등록</title>
        <!-- <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script> -->
        <!-- <validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/> -->
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
                            <h1 class="fw-bolder mb-1"><span id="titleVar">|</span>게시글 등록</h1>
                        </header>
                        <form:form modelAttribute="vo" id="detailForm" name="detailForm">
                            <div class="form-group">
                                <label for="title">제목</label>
                                <form:input type="text" path="title" class="form-control" id="boardTitle" placeholder="제목 입력" />
                                &nbsp;<form:errors path="title" />
                            </div>
                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <form:input type="text" path="writer" class="form-control" id="boardWriter" maxlength="50" placeholder="작성자 입력" />
                                &nbsp;<form:errors path="writer" />
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <form:textarea type="text" path="content" class="form-control" id="boardContent" placeholder="내용 입력" rows="10" maxlength="200" />
                                &nbsp;<form:errors path="content" />
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

        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>