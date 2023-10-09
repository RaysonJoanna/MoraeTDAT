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
    <style>
        .btn-success{
            height: 70px;
            width: 180px;
            font-size: 20px;
        }
    </style>
    <title>MoraeTDAT</title>
</head>
<body>
    <div id="" class="">
        <div class="d-flex justify-content-center">
            <img src="/img/logo.png" alt="logo" style="width: 70%; max-width: 700px;">
        </div>
    </div>
    <%

    %>
    <div class="container mt-5">
        <div class="row mb-5">
            <p class="h2 fw-bold text-center mt-5">관리자 페이지</p>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-3 d-flex justify-content-center">
                <button class="btn btn-success" onclick="window.location.href='/MoraeTDAT/admin/inquiry'">문의사항</button>
            </div>
            <div class="col-3 d-flex justify-content-center">
                <button class="btn btn-success" onclick="window.location.href='/MoraeTDAT/admin/notice'">공지사항</button>
            </div>
            <div class="col-3 d-flex justify-content-center">
                <button class="btn btn-success" onclick="window.location.href='/MoraeTDAT/admin/product'">상품관리</button>
            </div>
        </div>
        <div class="row d-flex justify-content-center mt-5">
            <div class="col-3 d-flex justify-content-center">
                <button class="btn btn-success" onclick="window.location.href='/MoraeTDAT/admin/member'">회원관리</button>
            </div>
            <div class="col-3 d-flex justify-content-center">
                <button class="btn btn-success" onclick="window.location.href='/MoraeTDAT/admin/morae'">모래 업데이트</button>
            </div>
            <div class="col-3 d-flex justify-content-center">
                <button class="btn btn-success" onclick="window.location.href='/MoraeTDAT/admin/healing'">Healing</button>
            </div>
        </div>
    </div>


</body>
</html>