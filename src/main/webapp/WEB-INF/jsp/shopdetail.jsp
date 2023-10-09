<%@ page import="MoraeTdat.data.Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>모래모레</title>
    <!-- 부트스트랩5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- 부트스트랩 js, popper js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    <!-- 홈 css -->
    <link rel="stylesheet" type="text/css" href="/css/home.css">
    <script type="text/javascript" src="/js/shop.js"></script>
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
            <div class="col-9 d-flex justify-content-center">
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
    <!-- 상품 목록 -->
<%
    Product product = (Product)request.getAttribute("product");
    String loginID = (String)session.getAttribute("loginID");

    String[] option = product.getProductoption().split(", ");
%>
    <div id="shopdetail">
        <hr>
        <p class="h1 fw-bold text-center mb-5" style="margin-top: 80px;">상품 상세페이지</p>
        <div class="container">
            <div class="row mt-5 pb-5 border pt-5 justify-content-center px-5">
                    <!-- 대표사진, 옵션 선택 -->
                    <div class="d-flex gap-3">
                        <img src="<%=product.getMainphoto()%>" alt="product" class="col border img-fluid" style="max-width: 550px">
                        <div class="col border">
                            <div style="margin-top: 100px;">
                                <p class="h2 text-center mt-5 mb-5"><%=product.getProductname()%></p>
                                <p class="fs-2" style="padding-left: 70px;"><%=product.getProductprice()%>원</p>
                            </div>
                            <div style="padding-left: 70px;">
                                <nav aria-label="..." >
                                    <ul class="pagination">
                                        <li class="page-item disabled" id="ma" onclick="gaesuDown()"><span class="page-link" >-</span></li>
                                        <li class="page-item" id="1"><span class="page-link" style="color:black" id="gaesu">1</span></li>
                                        <li class="page-item disabled" id="pl" onclick="gaesuUp()"><span class="page-link">+</span></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="mx-5">
                                <select name="product_option" id="product_option" class="form-control" style="margin-left: 23px; width:400px;">
                                    <%
                                        for(String opt : option){
                                     %>
                                        <option value="<%=opt%>" id="option"><%=opt%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mx-5 mt-4 d-flex">
                                <img src="/img/heart.png" alt="like" style="margin-left: 23px; width:50px;" class="border rounded p-2" onClick="heart(<%= product.getProductnum() %>,'<%=loginID%>')">
                                <button class="form-control" style="display: inline; margin-left:12px; width:164px" onclick="cartdetail(<%=product.getProductnum()%>,'<%=loginID%>',$('#product_option').val(),$('#gaesu').text())">장바구니</button>
                                <button class="form-control" style="display: inline; margin-left:12px; width:164px">구매하기</button>
                            </div>
                        </div>
                    </div>
                    <!-- 대표사진, 옵션 끝 -->

                    <!-- 제품정보(텍스트) -->
                    <div class="row mt-5 pb-5 border pt-5 justify-content-center px-5 d-flex">
                        <p class=""><%=product.getProductdetail()%></p>
                    </div>
                    <!-- 제품정보(텍스트) 끝 -->

                    <!-- 제품 정보(긴 사진) -->
                    <div class="row pb-5 pt-5 justify-content-center px-5 d-flex">
                        <img src="<%=product.getDetailphoto()%>" alt="photo_description">
                    </div>
                    <!-- 제품 정보(긴 사진) 끝 -->
                </div>
            </div>    
        </div>
    <!-- Footer -->
        <div class="pb-5"></div>
</body>
</html>