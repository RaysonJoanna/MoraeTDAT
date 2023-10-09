<%@ page import="MoraeTdat.data.Entity.Inquiry" %>
<%@ page import="MoraeTdat.data.Entity.Notice" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" type="text/css" href="/css/board.css">

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
<!-- 네비바 -->
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
<!-- 헤더 -->
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
    <!-- 컨텐츠 -->
    <div class="container" id="content" style="margin-top: 50px; background-color: #fcfcfc;">
        <div id="real_content">
            <div id="title" class="mt-3 mb-3">
                <p>공지사항</p>
            </div>
            <div id="board" class="mt-5">
                <div id="column">
                    <div id="col_num">
                        <p>번호</p>
                    </div>
                    <div id="col_title">
                        <p>제목</p>
                    </div>
                    <div id="col_id">
                        <p>아이디</p>
                    </div>
                    <div id="col_date">
                        <p>게시일</p>
                    </div>
                </div>
                <%
                    List<Notice> noticelist = (List<Notice>)request.getAttribute("noticelist");
                    for(Notice notice : noticelist){
                %>
                <!-- 문의사항 게시글 출력 -->
                <div id="row">
                    <div id="row_num">
                        <p><%=notice.getNoticenum()%></p>
                    </div>
                    <a href="/MoraeTDAT/notice/view?noticenum=<%=notice.getNoticenum()%>">
                        <div id="row_title">
                            <p><%=notice.getTitle()%></p>
                        </div>
                    </a>
                    <div id="row_id">
                        <p>관리자</p>
                    </div>
                    <div id="row_date">
                        <p><%=notice.getRegidate()%></p>
                    </div>
                </div>
                <%
                    }
                %>
            <!-- 문의사항 게시글 출력 -->
            </div>
            <div id="paging_container" class="mt-5">
                <div id="pc_sear_cont">
                    <input type="text" id="search" placeholder="  검색"/>
                </div>
            </div>
        </div>
    </div>
</body>
</html>