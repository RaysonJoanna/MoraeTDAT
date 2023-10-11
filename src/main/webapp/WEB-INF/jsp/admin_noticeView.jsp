<%@ page import="MoraeTdat.data.Entity.Notice" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- 부트스트랩5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- 부트스트랩 js, popper js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- 네비바 css -->
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <!-- 헤더 css -->
    <link rel="stylesheet" type="text/css" href="/css/header.css">
    <!-- 전체 css -->
    <link rel="stylesheet" type="text/css" href="/css/whole.css">

    <title>MoraeTDAT</title>
</head>
<body>
<div id="" class="">
    <div class="d-flex justify-content-center">
        <img src="/img/logo.png" alt="logo" style="width: 70%; max-width: 700px;cursor:pointer" onclick="window.location.href='/MoraeTDAT/admin/login-process'">
    </div>
</div>
<%
    Notice notice = (Notice) request.getAttribute("notice");
%>
<div class="container border" id="content" style="margin-top: 50px;">
    <div>
        <h2 class="text-center my-5 fw-bold">공지사항</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col d-flex p-3 mt-3" style="width:81%;">
                <p class="fs-5 ms-5 me-5 my-auto">제목</p>
                <p class="my-auto"><%=notice.getTitle()%></p>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col p-3 d-flex justify-content-center" style="width:90%;">
                <p id="naeyong" style="border: 1px solid #e2e2e2; width:90%;
                    max-width: 1300px;background-color: white;" class="mt-1 p-5 text-start mb-3"><%=notice.getContent()%></p>
            </div>
        </div>
        <div class="row d-flex justify-content-center p-2 mb-4">
            <div class="col-9"></div>
            <button class="btn btn-warning col-1 me-2" onclick="window.location.href='/MoraeTDAT/admin/notice/update?num=<%=notice.getNoticenum()%>'">수정</button>
            <button class="btn btn-danger col-1" onclick="window.location.href='/MoraeTDAT/admin/notice/delete?num=<%=notice.getNoticenum()%>'">삭제</button>
        </div>
    </div>
</div>