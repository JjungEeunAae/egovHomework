<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>게시판 목록</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- jeury -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <!-- sweetalert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.7/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.7/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="css/styles.css" rel="stylesheet" />
    <!-- AllList css -->
    <link href="css/index.css" rel="stylesheet" />
    <!-- boardDetail -->
    <link href="css/d_Index.css" rel="stylesheet" />
    <!-- boardUp -->
    <link rel="stylesheet" href="css/up_index.css">
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/project/">MAIN</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <!-- <li class="nav-item"><a class="nav-link" href="/project/list.do">Home</a></li> -->
                <!-- <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li> -->
                <form:form modelAttribute="searchVO" id="searchForm" name="searchForm" method="post" cssClass="d-flex">
                    <!-- <label for="searchCondition" style="display:none;"></label> -->
                    <!-- <spring:message code="search.choose" ></spring:message> -->
                    <form:select path="searchCondition" cssClass="me-1 form-select" id="searchItem">
                        <form:option value="" label="전체" selected="selected"></form:option>
                        <form:option value="1" label="제목"></form:option>
                        <form:option value="2" label="내용"></form:option>
                    </form:select>
                    <form:input cssClass="form-control me-2"
                                path="searchKeyword"
                                id="searchContent"
                                type="text"  
                                aria-label="Enter search term..." 
                                aria-describedby="button-search" 
                                value="${searchVO.searchKeyword}" 
                                maxlength="60"></form:input>
                    <button class="btn btn-outline-success" id="searchBtn" type="button">Search</button>
                </form:form>
            </ul>
        </div>
    </div>
</nav>