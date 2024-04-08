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
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>게시판 목록</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/index.css" rel="stylesheet" />
        <script src="js/index.js" type="text/javaScript" language="javascript" defer="defer"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/project/list.do">Start Bootstrap</a>
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
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post" class="d-flex">
                    <div class="col-lg-8">
                        <!-- Post content-->
                        <article>
                            <!-- Post header-->
                            <header class="mb-4">
                                <!-- Post title-->
                                <h1 class="fw-bolder mb-1"><span id="titleVar">|</span>게시판</h1>
                                <!-- Post categories-->
                            </header>
                                <div id="tableArea" class="m-3 p-2">
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
                                                    <td><a href="javascript:fn_select('<c:out value="${result.board_idx}"/>')"><c:out value="${result.title}"/></a></td>
                                                    <td class="exclude-row"><div class="txt_line">${result.content}</div></td>
                                                    <td><fmt:formatDate value="${result.date_created}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</td>
                                                    <td><c:out value="${result.writer}"/></td>
                                                    <td><c:out value="${result.like_count}"/></td>
                                                    <td><c:out value="${result.view_count}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div id="paging" class="d-flex justify-content-center">
                                        <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
                                        <form:hidden path="pageIndex" />
                                    </div>
                                    <div class="btn-area mb-4">
                                        <button type="button" class="btn btn-primary btn-lg" onclick="fn_addView()">등록</button>
                                    </div>
                            </div>
                        </article>
                    </div>
                    <!-- Side widgets-->
                    <div class="col-lg-4">
                        <!-- Search widget-->
                        <div class="card mb-4">
                            <div class="card-header">검색</div>
                            <div class="card-body">
                                <div class="input-group">
                                    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
                                    <form:select path="searchCondition" cssClass="use" class="form-select" id="searchItem">
                                        <form:option value="" label="선택" />
                                        <form:option value="1" label="제목" />
                                        <form:option value="2" label="내용" />
                                    </form:select>
                                    <form:input class="form-control" path="searchKeyword" id="searchContent" type="text"  aria-label="Enter search term..." aria-describedby="button-search" />
                                    <button class="btn btn-primary" id="searchBtn" type="button" onclick="fn_selectList();">Go!</button>
                                </div>
                            </div>
                        </div>
                        <!-- Categories widget-->
                        <!-- <div class="card mb-4">
                            <div class="card-header">Categories</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">Web Design</a></li>
                                            <li><a href="#!">HTML</a></li>
                                            <li><a href="#!">Freebies</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="#!">JavaScript</a></li>
                                            <li><a href="#!">CSS</a></li>
                                            <li><a href="#!">Tutorials</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- Side widget-->
                        <!-- <div class="card mb-4">
                            <div class="card-header">Side Widget</div>
                            <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                        </div> -->
                    </div>
                </form:form>
            </div>

            <!-- Modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#resultModal" id="modalBnt">
                Modal
            </button>
            <div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">글 등록 완료</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>글 등록이 완료되었습니다.</p>
                      <p>등록된 글을 확인해보시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary" id="detailRedirectBnt">바로가기</button>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
    </body>
</html>