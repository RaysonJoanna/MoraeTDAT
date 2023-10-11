<%@ page import="MoraeTdat.data.Entity.User" %>
<%@ page import="MoraeTdat.data.Entity.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <script type="text/javascript" src="/js/mypage.js"></script>
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
            <%
                String userid = (String) session.getAttribute("loginID");
            %>
            <div class="col-2 mb-4 p-0" id="userInfo">
                <%
                    if(userid==null) {
                %>
                <div class="mt-4 d-flex justify-content-center">
                    <img src="/img/user.png" alt="userInfo" height="30px" width="30px">
                    <p style="margin-left: 5px;" id="showUserId">비회원</p>
                </div>
                <%
                } else {
                %>
                <a href="/MoraeTDAT/mypage?userid=<%=userid%>">
                    <div class="mt-4 d-flex justify-content-center">
                        <img src="/img/user.png" alt="userInfo" height="30px" width="30px">
                        <p style="margin-left: 5px;" id="showUserId">비회원</p>
                    </div>
                </a>
                <%
                    }
                %>
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
    <div id="mypage" class="border rounded-3" style="background-color: #FCFCFC;">
        <div class="mb-3 mt-5">
            <p class="text-center h1">마이페이지</p>
            <div class="d-flex justify-content-center mt-5">
                <p onclick="gOn()" style="cursor: pointer;">계정정보</p>
                <p>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
                <p onclick="jOn()" style="cursor: pointer;">주문내역</p>
            </div>
        </div>
        <script>
            function gOn(){
                $('#userInformation').show();
                $('#orderHistory').hide();
            }
            function jOn(){
                $('#orderHistory').show();
                $('#userInformation').hide();
            }
        </script>
        <!--개인정보-->
        <div id="gaeinjeongbo">
            <div id="userInformation" style="padding: 20px 200px;">
                <%
                    User user = (User) request.getAttribute("user");
                %>
                <!-- 아이디 -->
                <div class="input-group mb-3">
                    <span class="input-group-text" name="id" id="id"><img src="/img/userbk.png" style="width: 25px;"></span>
                    <input type="text" class="form-control" style="background-color: white" aria-label="Username" aria-describedby="basic-addon1" value="<%=user.getUserid()%>" readonly>
                </div>
                <!-- 비밀번호 -->
                <div class="input-group mb-3">
                    <span class="input-group-text" name="pw" id="pw"><img src="/img/lock.png" style="width: 25px;"></span>
                    <input type="text" class="form-control" style="background-color: white" placeholder="  ********" aria-label="Username" aria-describedby="basic-addon1" readonly>
                </div>
                <!-- 비밀번호 확인 -->
                <div class="input-group mb-3">
                    <span class="input-group-text" name="pwCheck" id="pwCheck"><img src="/img/check.png" style="width: 25px;"></span>
                    <input type="text" class="form-control" placeholder="  ********" aria-label="Username" aria-describedby="basic-addon1">
                    <span class="input-group-text" name="pwCheck" id="pwChange" onclick="changePW()" style="cursor: pointer">비밀번호 변경</span>
                </div>
                <!-- 휴대폰번호 -->
                <div class="input-group mb-3">
                    <span class="input-group-text" id="phoneNumber"><img src="/img/phone.png" style="width: 25px;"></span>
                    <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" value="<%=user.getUserphone()%>">
                    <span class="input-group-text" id="phoneChange" onclick="changePhone()" style="cursor: pointer">전화번호 변경</span>
                </div>
                <!-- 이메일 -->
                <div class="input-group mb-3">
                    <span class="input-group-text" id="email"><img src="/img/email.png" style="width: 25px;"></span>
                    <input type="text" class="form-control" placeholder="  기존이메일" aria-label="Username" aria-describedby="basic-addon1" value="<%=user.getUseremail()%>">
                    <span class="input-group-text" id="emailChange" onclick="changeEmail()" style="cursor: pointer">이메일 변경</span>
                </div>
                <!-- 우편번호 -->
                <div class="container mb-5" style="padding:0;">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><img src="/img/addr.png" style="width: 25px;"></span>
                        <div class="form-control">
                            <input type="text"  name="zonecode" id="zonecode" class="form-control" style="width: 70%; display:inline-block">
                            <button class="form-control mb-2 zbtn" type="button" onclick="DaumPostcode()" id="button-addon2">우편번호 찾기</button>
                            <input type="text" name="address" id="address" class="form-control mb-2" placeholder="주소">
                            <input type="text" name="detailAddress" id="detailAddress" class="form-control" placeholder="상세주소">
                            <div class="d-flex justify-content-end">
                                <button class="form-control mb-1 zbtn mt-2 ml-auto" type="button" id="addrChange" style="background-color: #e2e2e2">주소 변경</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="ischangePw" value="">
                <input type="hidden" id="ischangePhone" value="">
                <input type="hidden" id="ischangeEmail" value="">
                <div class="d-flex justify-content-center">
                    <button class="form-control mb-1 zbtn ml-auto" type="button" id="mypageChange" style="background-color: #e2e2e2 " onclick="changeSave()">변경사항 저장</button>
                </div>
            </div>
            <!-- 디비에서 최근 3개 조회 -->
            <%
                List<Orders> ordersList = (List<Orders>)request.getAttribute("orderlist");
                List<String> photoList = (List<String>)request.getAttribute("photolist");

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                for(int i=0; i<ordersList.size(); i++){
                    Orders order = ordersList.get(i);
                    String photo = photoList.get(i);
                    String date = dateFormat.format(order.getOrderdate());
            %>
            <div id="orderHistory">
                <div style="margin: 0 80px;" class="mt-5 mb-5">
                    <div class="border py-3" style="background-color: white;">
                        <p style="margin-left: 15px;" class="mb-2">주문번호 <%=order.getOrdernum()%>&nbsp;&nbsp;&nbsp;주문날짜 <%=date%></p>
                        <div class="d-flex mt-3">
                            <img src="<%=photo%>" alt="product_img" style="width: 180px; margin-left: 30px">
                            <div class="border p-3" style="margin-left: 30px; width: 720px;">
                                <p class="fs-5"><%=order.getProductname()%></p>
                                <p>&nbsp;수량 : <%=order.getAmount()%> &nbsp;&nbsp;|&nbsp;&nbsp;옵션 : <%=order.getProductoption()%></p>
                                <p class="fw-bold">&nbsp;<%=order.getProductprice()%>원</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <!-- Footer -->
    <div class="footer" id="footer" style="position: absolute; top : 1650px; left :335px;">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        let addr = '';
        let zonecode = '';

        new daum.Postcode({
            oncomplete : function(data) {
                addr = data.address;
                zonecode = data.zonecode;
                $('#address').val(addr);
                $('#userzcode').val(zonecode);
                $('#detailAddress').focus();
            }
        }).open();
    }
</script>
</body>
</html>l>