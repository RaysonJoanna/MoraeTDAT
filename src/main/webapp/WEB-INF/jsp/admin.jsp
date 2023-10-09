<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<div id="navbar">
    <ul id="navbar_list" class="nav flex-column pt-2 mt-5 ms-3">
        <li class="nav-item">
            <p class="fw-bold fs-3">Category
        </li>
        <li class="nav-item">
            <a class="nav-link">&raquo; 티셔츠</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">&raquo; 리빙</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">&raquo; 오피스</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">&raquo; 귀여움</a>
        </li>
        <br>
        <li class="nav-item">
            <a class="nav-link">베스트</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">신상</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">할인상품</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">예약판매</a>
        </li>
        <br>
        <li class="nav-item">
            <a class="nav-link">문의사항</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">공지사항</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">ContactUs</a>
        </li>
        <br>
        <li class="nav-item">
            <a class="nav-link mb-3">About모래</a>
        </li>
    </ul>
</div>
<div id="header" class="container">
    <div class="row">
        <div class="col-8">
            <a href="home"><img src="/img/logo.png" alt="logo" class="mx-auto img-fluid"></a>
        </div>
    </div>
</div>
<div class="container" id="content" style="margin-top: 100px;">
    <div class="container justify-content-center border w-50" style="height : 350px; margin : auto; background-color: #fcfcfc;">
        <div style="height : 300px; margin : 25px 0;">
            <div class="row">
                <p class="text-center fs-2 mt-2">관리자 페이지</p>
            </div>
            <form class="row mt-3" action="/MoraeTDAT/admin/login-process" method="post" name="adminLogin">
                <div class="col-12 mx-auto mb-2">
                    <div class="input-group w-50 mx-auto mb-2">
                        <label class="input-group-text" for="username" style="width : 50px">ID</label>
                        <input type="text" class="form-control" id="username" name="adminID"/>
                    </div>
                    <div class="input-group w-50 mx-auto mb-2">
                        <label class="input-group-text" for="password" style="width : 50px">PW</label>
                        <input type="password" class="form-control" id="password" name="adminPW"/>
                    </div>
                    <div class="input-group w-50 mx-auto mt-4">
                        <button type="submit" class="w-100 btn btn-primary">로그인</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 푸터 -->
<div class="footer" style="position: absolute; top : 700px; left :335px;">
    <hr>
    <div class="container d-flex align-items-center mt-5">
        <div class="col">
            <img src="/img/logo.png" alt="Logo" class="img-fluid">
        </div>
        <div class="col">
            <div class="container text-start ms-5">
                <p>&copy; 모래모레 All rights reserved.<br>
                    주소 : 경남 남해군 상주면 상주로 17-4 벤치오피스 2층<br>
                    대표 : 강소희 &nbsp;&nbsp;| &nbsp;&nbsp;사업자등록번호 : 2021-1009<br>
                    제휴협력문의 : raysonkingdom@gmail.com
                </p>
            </div>
        </div>
        <div class="col">
            <div class="container text-start ms-5">
                <p><b>고객센터</b><br><br>
                    전화번호 : 055-2021-1009<br>
                    주말, 공휴일은 모래 복지를 위해 운영하지 않습니다.<br>
                    <img src="/img/kakao-talk.png" class="img-fluid" style="width: 20px; margin-right:5px;">카카오채널 : MoraeTDAT
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>