<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>게시글 상세</title>
    </head>
    <body>
        <!-- Responsive navbar-->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Post content-->
                    <article id="boardDetail" name="${boardInfo.board_idx}">
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${boardInfo.title}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">
                                <c:choose>
                                    <c:when test="${empty boardInfo.writer}">
                                        <span id="writer">작성자 없음&nbsp;/&nbsp;</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span id="writer">${boardInfo.writer}&nbsp;/&nbsp;</span>
                                    </c:otherwise>
                                </c:choose>
                                <span id="dateCreated">작성일 : <fmt:formatDate value="${boardInfo.date_created}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;/&nbsp;</span>
                                <span>좋아요 : <span id="likeCnt">${boardInfo.like_count}</span>&nbsp;/&nbsp;</span>
                                <span>조회수 : <span id="viewCnt">${boardInfo.view_count}</span></span>
                            </div>
                            <!-- Post categories-->
                            <!-- <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a> -->
                        </header>
                        <!-- Preview image figure-->
                        <!-- <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure> -->
                        <!-- 게시글 내용-->
                        <section class="mb-5 contents">
                            <p class="fs-5 mb-4">${boardInfo.content}</p>
                        </section>
                    </article>
                    <article>
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex justify-content-center likeCntArea">
                                        <img src="images/egovframework/likeCount/thumb-up_14989232.png" width="40px" alt="likeCount" id="likeCount">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="container">
                            <div class="row" id="boardListAndUpAndDelBnt">
                                <div class="col">
                                    <button type="button" class="btn btn-secondary" id="listRedirect">목록</button>
                                </div>
                                <div class="col">
                                    <button type="button" class="btn btn-info" id="upRedirect">수정</button>
                                </div>
                                <div class="col">
                                    <form id="deleteForm" method="POST" action="/project/boardDel.do">
                                        <input type="hidden" value="${boardInfo.board_idx}" name="boardIdx">
                                        <button type="submit" class="btn btn-danger" id="delRedirect">삭제</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </article>
                    <!-- 댓글 영역-->
                    <section class="mb-5" style="clear: both;">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <div class="row">
                                    <form:form class="d-flex" modelAttribute="replyVO" id="replyAddForm" name="replyAddForm">
                                    <div class="col-11">
                                        <form:input path="board_idx" type="hidden" value="${boardInfo.board_idx}"></form:input>
                                        <form:input path="writer" cssClass="form-control mb-2" type="text" placeholder="작성자" id="replyWriter"></form:input><form:errors path="writer" />
                                        <form:textarea path="content" cssClass="form-control" rows="3" placeholder="내용을 입력해주세요." style="resize: none;" id="replyContent"></form:textarea>&nbsp;<form:errors path="content" />
                                    </div>
                                    <div class="col-1 replyBntArea">
                                        <button type="button" class="btn btn-secondary btn-lg" id="replySaveBnt">등록</button>
                                    </div>
                                    </form:form>
                                </div>
                                <!-- Comment with nested comments-->
                                <div class="mb-4">
                                    <!-- Parent comment-->
                                    <c:choose>
                                        <c:when test="${empty reply}">
                                            <div class="col text-center">
                                                <p>등록된 댓글이 없습니다.</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="parent" items="${reply}" varStatus="status">
                                            <div class="col mb-3 contentArea">
                                                <div class="d-flex">
                                                    <!-- 부모 -->
                                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                    <div class="ms-3 contentInnerArea">
                                                        <div>
                                                            <div class="fw-bold mb-1">${parent.writer}</div>
                                                            <div>
                                                                <p class="text-break">${parent.content}</p>
                                                            </div>
                                                        </div>
                                                        <!-- 자식 -->
                                                        <c:forEach var="child" items="${parent.childReply}">
                                                        <div class="d-flex mt-2 contentChildArea">
                                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                            <div class="ms-3">
                                                                <div class="fw-bold">${child.writer}</div>
                                                                <div>
                                                                    <p class="text-break">${child.content}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            
                                    <!-- <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                            Child comment 1
                                            <div class="d-flex mt-4">
                                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div class="ms-3">
                                                    <div class="fw-bold">Commenter Name</div>
                                                    And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                                </div>
                                            </div>
                                            Child comment 2
                                            <div class="d-flex mt-4">
                                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div class="ms-3">
                                                    <div class="fw-bold">Commenter Name</div>
                                                    When you put money directly to a problem, it makes a good headline.
                                                </div>
                                            </div>
                                        </div> -->
                                <!-- Single comment-->
                                <!-- <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                    </div> -->
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>