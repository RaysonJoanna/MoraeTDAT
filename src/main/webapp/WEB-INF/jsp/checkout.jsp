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
    <!-- 카카오페이 필요 js -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
    <div id="checkout1" class="border rounded-3" style="background-color: #f7f7f7;">
        <div class="mb-5 mt-5">
            <p class="text-center h1">주문하기</p>
        </div>
        <!--입력폼-->
        <form name="signup" class="mb-5" id="fregister" action="signup" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">
            <div class="px-5">
                <!-- 주문자 정보 -->
                <div class="border rounded px-5 py-2" style="background-color: white;">
                    <div class="mt-3 mb-3 d-flex">
                        <h4 class="text-center mb-0">주문자 정보</h4>
                        <input type="checkbox" name="orderinfo" id="orderinfo" class="ms-5 me-2">계정정보 불러오기
                    </div>
                    <!-- 이름 -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" name="id" id="id"><img src="/img/userbk.png" style="width: 25px;"></span>
                        <input type="text" class="form-control" placeholder="  이름" aria-label="name" aria-describedby="basic-addon1">
                    </div>
                    <!-- 연락처 -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" name="phoneNumber" id="phoneNumber"><img src="/img/phone.png" style="width: 25px;"></span>
                        <input type="text" class="form-control" placeholder="  연락처" aria-label="phoneNumber" aria-describedby="basic-addon1">
                    </div>
                    <!-- 이메일 -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" name="email" id="email"><img src="/img/email.png" style="width: 25px;"></span>
                        <input type="text" class="form-control" placeholder="  이메일" aria-label="email" aria-describedby="basic-addon1">
                    </div>
                </div>
                <!-- 주문자 정보 끝 -->

                <!-- 배송 정보 -->
                <div class="border rounded px-5 py-2 mt-5" style="background-color: white;">
                    <div class="mt-3 mb-3 d-flex">
                        <h4 class="text-center mb-0">배송 정보</h4>
                        <input type="checkbox" name="orderinfo" id="orderinfo" class="ms-5 me-2">주문자 정보와 동일
                    </div>
                    <!-- 이름 -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" name="id" id="id"><img src="/img/userbk.png" style="width: 25px;"></span>
                        <input type="text" class="form-control" placeholder="  이름" aria-label="name" aria-describedby="basic-addon1">
                    </div>
                    <!-- 연락처 -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" name="phoneNumber" id="phoneNumber"><img src="/img/phone.png" style="width: 25px;"></span>
                        <input type="text" class="form-control" placeholder="  연락처" aria-label="phoneNumber" aria-describedby="basic-addon1">
                    </div>
                    <!-- 우편번호 -->
                    <div class="container mb-5" style="padding:0;">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><img src="/img/addr.png" style="width: 25px;"></span>
                            <div class="form-control">
                                <input type="text" name="zonecode" id="zonecode" class="form-control" style="width: 70%; display:inline-block">
                                <button class="form-control mb-2 zbtn" type="button" onclick="DaumPostcode()" id="button-addon2">우편번호 찾기</button>
                                <input type="text" name="address" id="address" class="form-control mb-2" placeholder="주소">
                                <input type="text" name="detailAddress" id="detailAddress" class="form-control" placeholder="상세주소">
                            </div>  
                        </div>
                    </div>
                </div>
                <!-- 배송 정보 끝 -->

                <!-- 주문내역 -->
                <div style="width: 1100px;" class="mt-5 mb-5">
                    <div class="border py-3 rounded" style="background-color: white;">
                        <p style="margin-left: 15px;" class="mb-2">주문번호 21414&nbsp;&nbsp;&nbsp;주문날짜 2023-09-17</p>
                        <div class="d-flex mt-3">
                            <input type="checkbox" name="historyCheck" id="historyCheck" style="margin: 0 30px;">
                            <img src="/img/sale_item.png" alt="product_img" style="width: 180px;">
                            <div class="border d-flex" style="margin-left: 30px; width: 720px;">
                                <p>제품명</p>
                                <p>수량,옵션</p>
                                <p>가격</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center mt-2">
                            <p style="margin-top: 20px; margin-bottom: 5px;">더보기</p>
                        </div>
                    </div>
                </div>            
                <!-- 주문내역 끝 -->

                <!-- 결제 수단 선택 -->
                <div class="border rounded px-5 py-2 mt-5" style="background-color: white;">
                    <div class="mt-3 mb-3 d-flex justify-content-center">
                        <h2 class="text-center mt-3 mb-3">결제 정보</h2>
                    </div>
                    <div style="margin-left: 70px;" class="mb-5">
                        <button type="button" id="credit" class="btn btn-lg border rounded mx-3 my-3" style="width:250px; height: 50px;background-color: #EEEEEE;" onClick="checkout()">신용카드</button>
                        <button type="button" id="noaccount" class="btn btn-lg border rounded mx-3 my-3" style="width:250px; height: 50px;background-color: #EEEEEE;" onClick="checkout()">무통장입금</button>
                        <button type="button" id="liveaccount" class="btn btn-lg border rounded mx-3 my-3" style="width:250px; height: 50px;background-color: #EEEEEE;" onClick="checkout()">실시간 계좌이체</button>
                        <button type="button" id="phonepay" class="btn btn-lg border rounded mx-3 my-3" style="width:250px; height: 50px;background-color: #EEEEEE;" onClick="checkout()">휴대폰결제</button>
                        <button type="button" id="naverpay" class="btn btn-lg border rounded mx-3 my-3" style="width:250px; height: 50px;background-color: #EEEEEE;" onClick="checkout()">네이버페이</button>
                        <button type="button" id="kakaopay" class="btn btn-lg border rounded mx-3 my-3" style="width:250px; height: 50px;background-color: #EEEEEE;" onClick="checkout()">카카오페이</button>
                    </div>
                </div>
                <!-- 결제 수단 선택 끝 -->
            </div>
        </form>
    </div>    
    <!-- Footer -->
    <div class="footer" style="position: absolute; top : 2000px; left :335px;">
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
        <div class="mb-5">
        </div>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://spay.kcp.co.kr/plugin/kcp_spay_hub.js"></script>
    <script>
        function DaumPostcode() {
            let addr = '';
            let zonecode = '';

            new daum.Postcode({
                oncomplete : function(data) {
                    addr = data.address;
                    zonecode = data.zonecode;
                    $('#address').val(addr);
                    $('#zonecode').val(zonecode);
                    $('#detailAddress').focus();
                }
            }).open();
        }

        function checkout(){
            alert("결제가 완료되었습니다.");
            location.href("/home");
        }
    </script>
</body>
</html>