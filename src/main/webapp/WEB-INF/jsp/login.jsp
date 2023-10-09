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
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <title>MoraeTDAT</title>
</head>
<body>
<script type="text/javascript">
    window.onload = () => {
        let showID = '${sessionScope.loginID}';

        if(showID === "" || showID === 'null'){
            $('#showUserId').text("비회원");
            $('#login').show();
        } else {
            $('#showUserId').text(showID);
            $('#login').hide();
            $('#logout').show();
        }
    }
</script>

<div id="navbar">
    <ul id="navbar_list" class="nav flex-column pt-2 mt-5 ms-3">
        <li class="nav-item">
            <p class="fw-bold fs-3">Category
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=tshirts">&raquo; 티셔츠</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=living">&raquo; 리빙</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=office">&raquo; 오피스</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=cute">&raquo; 귀여움</a>
        </li>
        <br>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=best">베스트</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=new">신상</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=sale">할인상품</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/shop?category=preorder">예약판매</a>
        </li>
        <br>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/inquiry">문의사항</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/notice">공지사항</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/MoraeTDAT/contact">ContactUs</a>
        </li>
        <br>
        <li class="nav-item">
            <a class="nav-link mb-3" href="/MoraeTDAT/morae">About모래</a>
        </li>
    </ul>
</div>
<div id="header" class="container">
    <div class="row">
        <div class="col-8">
            <a href="/MoraeTDAT/home"><img src="/img/logo.png" alt="logo" class="mx-auto img-fluid"></a>
        </div>
        <div class="col-2 mb-4 p-0" id="userInfo">
            <div class="mt-4 d-flex justify-content-center">
                <img src="/img/user.png" alt="userInfo" height="30px" width="30px">
                <p style="margin-left: 5px;" id="showUserId">비회원</p>
            </div>
            <div>
                <div class="d-flex  justify-content-center">
                    <a class="userThing" href="/MoraeTDAT/login" id="login"><p>로그인</p></a>
                    <a class="userThing" href="/MoraeTDAT/logout" id="logout" style="display: none"><p>로그아웃</p></a>
                    <a class="userThing" href="/MoraeTDAT/register" style="margin-left: 30px;"><p>회원가입</p></a>
                </div>
                <div class="mb-2 text-center">
                    <a href="/MoraeTDAT/shop/cartpage"><img src="/img/cart.png" class="cart" alt="cart" style="width:35px; margin-right: 15px;"></a>
                    <a href="/MoraeTDAT/shop/heartpage"><img src="/img/heart.png" class="heart ms-3" alt="heart" style="width:35px"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" id="content" style="margin-top: 100px;">
    <div class="container justify-content-center border w-50" style="height : 350px; margin : auto; background-color: #fcfcfc;">
        <div style="height : 300px; margin : 25px 0;">
            <div class="row">
                <p class="text-center fs-2">로그인</p>
            </div>
            <form class="row" method="POST" id="loginform">
                <div class="col-12 mx-auto mb-2">
                    <div class="input-group w-50 mx-auto mb-2">
                        <label class="input-group-text" for="id" style="width : 50px">ID</label>
                        <input type="text" class="form-control" id="id" name="id"/>
                    </div>
                    <div class="input-group w-50 mx-auto mb-2">
                        <label class="input-group-text" for="pw" style="width : 50px">PW</label>
                        <input type="password" class="form-control" id="pw" name="pw"/>
                        <!--<button type="button" sytle="position : absolute, z-layer : 1"></button>-->
                    </div>
                    <div class="input_group mx-auto mb-2" style="padding-left : 370px;">
                        <input type="checkbox" class="me-1" id="memory_id" name="memory_id"><label for="memory_id">아이디 저장</label>
                    </div>
                    <div class="input-group w-50 mx-auto">
                        <button type="button" class="w-100 btn btn-primary" onclick="login();">로그인</button>
                    </div>
                </div>
                <div class="col-12 d-flex justify-content-center mx-auto">
                    <a href="/MoraeTDAT/register">회원가입</a><p>&nbsp;|&nbsp;</p><a onclick="find_id_popup();" style="cursor:pointer;">아이디 찾기</a><p>&nbsp;|&nbsp;</p><a onclick="find_pw_popup()" style="cursor:pointer;">비밀번호 찾기</a>
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

<script type="text/javascript" src="/js/login.js"></script>
</body>
</html>