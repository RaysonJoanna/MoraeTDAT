<%@ page import="MoraeTdat.data.Entity.Heart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
            <div class="col-1">
                <!-- 위치 차지 -->
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
    <!-- 회원가입 폼 -->
    <div id="cart" class="border rounded-3" style="background-color: #FCFCFC;">
        <div class="mb-3 mt-5">
            <p class="text-center h1 mt-5">찜 목록</p>
        </div>
            <!-- 디비에서 최근 상품 조회 (페이징) -->
            <div id="cartlist">
                <form>
                <div style="margin: 0 80px;" class="mt-5 mb-5">
                    <div class="border py-3" style="background-color: white;">
                        <div class="d-flex align-end mt-2">
                            <a href="" class="ms-auto" onclick="select_All(event)"><p style="margin-left: 15px;" class="mb-2 text-end fs-6">전체선택</p></a>
                            <a href="/MoraeTDAT/shop/heartpage/all-delete" class="me-4"><p style="margin-left: 15px;" class="mb-2 text-end fs-6">전체삭제</p></a>
                            <a href="" class="me-4" onclick="part_deleteH(event)"><p style="margin-left: 15px;" class="mb-2 text-end fs-6">선택삭제</p></a>
                        </div>
                        <%
                            List<Heart> heartList = (ArrayList<Heart>)request.getAttribute("heartlist");
                            int total_price = 0;

                            for(Heart heart : heartList){
                        %>
                        <!-- 상품 하나 -->
                        <div class="d-flex mt-5">
                            <p style="display: none" class="productnum"><%=heart.getProductnum()%></p>
                            <input type="checkbox" name="historyCheck" class="historyCheck"  style="margin: 0 30px;">
                            <img src="<%=heart.getMainphoto()%>" alt="product_img" style="width: 180px;">
                            <div class="border p-4 mx-auto" style="margin-left: 30px; width: 720px;">
                                <p class="h3 fw-bold"><%=heart.getProductname()%></p>
                                <p class="h5 ms-2"><%=heart.getProductprice()%>원</p>
                            </div>
                        </div>
                        <!-- 상품 하나 끝 -->
                        <%
                                total_price += heart.getProductprice();
                            }
                        %>
                        <!-- 금액 표시창 -->
                        <%
                            int delivery_fee = 0;

                            if(total_price<50000){
                                delivery_fee = 3000;
                            }
                        %>
                        <div>
                            <p class="h6 mt-5 ms-5" style="color: gray">* 5 만원 이상 구매시 무료배송</p>
                            <div class="border py-5 mb-5 ms-5 me-5 d-flex" style="background-color: white;">
                                <p class="fs-2 fw-bold my-auto" style="margin-left: 60px;">전체 금액</p>
                                <p class="fs-4 my-auto" style="margin-left: 60px;"><%=total_price%></p>
                                <p class="fs-4 my-auto" style="margin-left: 40px;">&nbsp;+&nbsp;</p>
                                <div class="d-flex">
                                    <p class="fs-4 my-auto" style="margin-left: 40px;"><%=delivery_fee%></p>
                                    <p class="fs-6 my-auto">(배송비)</p>
                                </div>
                                <p class="fs-2 fw-bold my-auto" style="margin-left: 80px;">=&nbsp;&nbsp;&nbsp;<%=total_price + delivery_fee%>원</p>
                            </div>
                        </div>
                    </div>
                    <!-- 금액 표시창 끝 -->

                    <!-- 구매버튼 -->
                    <div class="mt-5 d-flex justify-content-center gap-5">
                        <button type="button" class="btn btn-lg border rounded" style="width:250px; height: 50px;background-color: #EEEEEE;">장바구니</button>
                    </div>
                    <!-- 구매버튼 끝 -->
                </div>
                </form>
            </div>
        </div>
    </div>    
    
    <!-- Footer -->
    <div class="footer" style="position: absolute; top : 1650px; left :335px;">
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
                <div class="container text-start ms-5" >
                    <p><b>고객센터</b><br><br>
                        전화번호 : 055-2021-1009<br>
                        주말, 공휴일은 모래 복지를 위해 운영하지 않습니다.<br>
                        <img src="/img/kakao-talk.png" class="img-fluid" style="width: 20px; margin-right:5px;">카카오채널 : MoraeTDAT
                    </p>
                </div>
            </div>
        </div>
        <div class="mb-5"></div>
    </div>
</body>
</html>