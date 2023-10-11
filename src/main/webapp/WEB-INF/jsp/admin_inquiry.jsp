<%@ page import="MoraeTdat.data.Entity.Inquiry" %>
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
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/board.css">
    <title>MoraeTDAT</title>
</head>
<body>
    <div id="" class="">
        <div class="d-flex justify-content-center">
            <img src="/img/logo.png" alt="logo" style="width: 70%; max-width: 700px;cursor:pointer" onclick="window.location.href='/MoraeTDAT/admin/login-process'">
        </div>
    </div>
    <!-- 컨텐츠 -->
    <div class="container" id="content" style="margin-top: 50px; background-color: #fcfcfc;">
        <div id="real_content">
            <div id="title" class="mt-3 mb-3">
                <p>문의사항</p>
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
    List<Inquiry> inquiryList = (List<Inquiry>)request.getAttribute("inquirylist");

    for(Inquiry inquiry : inquiryList){
%>

                <div id="row">
                    <div id="row_num">
                        <p class="num"><%=inquiry.getInquirynum()%></p>
                    </div>
                    <a href="/MoraeTDAT/admin/inquiry/view?inquirynum=<%=inquiry.getInquirynum()%>">
                        <div id="row_title">
                            <p><%=inquiry.getTitle()%></p>
                            <%
                                if(!(inquiry.getAnswercontent().equals(""))){
                            %>
                            <p class="btn btn-success btn-sm ms-2 replied">답변완료</p>
                            <%
                                }
                            %>
                        </div>
                    </a>
                    <div id="row_id">
                        <p><%=inquiry.getUserid()%></p>
                    </div>
                    <div id="row_date">
                        <p><%=inquiry.getRegidate()%></p>
                    </div>
                </div>

<%
    }
%>
            </div>
            <div id="paging_container" class="mt-5">
                <div id="pc_sear_cont">
                    <input type="text" id="search" placeholder="  검색"/>
                </div>
                <div id="pc_page_cont">
                    <button>&lt;</button>
                    <p class="my-auto">현재페이지 / 전체페이지</p>
                    <button>&gt;</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>