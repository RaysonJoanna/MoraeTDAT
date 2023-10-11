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
    <link rel="stylesheet" href="/css/board.css">
    <title>MoraeTDAT</title>
</head>
<body>
    <div id="" class="">
        <div class="d-flex justify-content-center">
            <img src="/img/logo.png" alt="logo" style="width: 70%; max-width: 700px;">
        </div>
    </div>
    <div>
        <h2 class="text-center my-5 fw-bold">공지사항</h2>
    </div>
    <%
        Notice notice = (Notice)request.getAttribute("notice");
    %>
    <div class="container" id="content" style="margin-top: 50px; background-color: #fcfcfc;">
        <div class="container">
            <form action="/MoraeTDAT/admin/notice/update-process" method="post">
            <input type="hidden" name="noticenum" value="<%=notice.getNoticenum()%>">
            <div class="row">
                <div class="col border d-flex p-3 justify-content-center">
                    <p class="fs-5 ms-2 me-5 my-auto">제목</p>
                    <input type="text" name="title" style="border: 1px solid #e2e2e2; width:70%;max-width: 800px;" value="<%=notice.getTitle()%>">
                </div>
            </div>
            <div class="row">
                <div class="col border-start border-end p-3 d-flex justify-content-center" style="width:90%; height:570px">
                    <textarea name="content" style="border: 1px solid #e2e2e2; width:90%;
            max-width: 1300px; height:500px;resize: none" class="mt-3" value="<%=notice.getContent()%>" onkeypress="onTestChange();"></textarea>
                </div>
            </div>
                <script>
                    function onTestChange() {
                        var key = window.event.keyCode;

                        // If the user has pressed enter
                        if (key === 13) {
                            document.getElementById("txtArea").value = document.getElementById("txtArea").value + "\n*";
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                </script>
            <div class="row d-flex justify-content-center border-start border-end border-bottom pb-4">
                <button class="btn btn-warning col-5" type="submit">공지사항 수정</button>
            </div>
            </form>
        </div>
    </div>
    <div class="mb-5">
        <p></p>
    </div>
</body>
</html>