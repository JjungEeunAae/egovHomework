<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>게시판 목록</title>
    </head>
    <body>
        <!-- Responsive navbar-->
        <jsp:include page="header.jsp"></jsp:include>

        <!-- Page content-->
        <div class="container mt-5">
            <form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1"><span id="titleVar">|</span>게시판</h1>
                            <!-- Post categories-->
                        </header>
                        <div id="tableArea" class="m-3 p-2">
                            <c:choose>
                                <c:when test="${totCnt == 0}">
                                    <div class="d-flex justify-content-center">
                                        <h3>검색된 결과가 없습니다.</h3>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="idx" />
                                    <table class="table boardAllList">
                                        <colgroup>
                                            <col width="5%"/>
                                            <col width="15%"/>
                                            <col width="30%"/>
                                            <col width="15%"/>
                                            <col width="15%"/>
                                            <col width="10%"/>
                                            <col width="10%"/>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>제목</th>
                                                <th>내용</th>
                                                <th>작성일</th>
                                                <th>작성자</th>
                                                <th>좋아요</th>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                                <tr>
                                                    <td>
                                                        <span id="boardIdx_${result.board_idx}" name="${result.board_idx}">
                                                            <c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/>
                                                        </span>
                                                    </td>
                                                    <td class="exclude-row"><a href="javascript:fn_select('<c:out value="${result.board_idx}"/>')"><c:out value="${result.title}"/></a></td>
                                                    <td class="exclude-row"><div class="txt_line">${result.content}</div></td>
                                                    <td><fmt:formatDate value="${result.date_created}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</td>
                                                    <td><c:out value="${result.writer}"/></td>
                                                    <td><c:out value="${result.like_count}"/></td>
                                                    <td><c:out value="${result.view_count}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- paging -->
                                    <div id="paging" class="d-flex justify-content-center">
                                        <c:if test="${not empty paginationInfo}">
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
                                        </c:if>
                                        <form:hidden path="pageIndex" />
                                    </div>
                                    <div class="btn-area mb-5">
                                        <button type="button" class="btn btn-primary btn-lg" onclick="fn_addView()">등록</button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </article>
                </div>
            </div>
            </form:form>
        </div>

        <!-- Footer-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>