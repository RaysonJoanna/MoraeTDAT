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
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <script type="text/javascript" src="/js/login.js"></script>
    <title>비밀번호 찾기</title>
</head>
<body>
    <div>
        <img src="/img/logo.png" alt="로고" style="width:600px;" class="mb-5">
        <p class="h4 text-center fw-bold">비밀번호 찾기</p>
    </div>
    <div style="width:600px;" class="p-5 mt-3" id="beforeFind">
        <div class="input-group mb-3">
            <span class="input-group-text" name="id" ><img src="/img/userbk.png" style="width: 25px;"></span>
            <input type="text" class="form-control" id="userid" placeholder="  아이디 (영어,숫자 포함 8~25자리)" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" name="phoneNumber"><img src="/img/phone.png" style="width: 25px;"></span>
            <input type="text" class="form-control" id="userphone" placeholder="  전화번호" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" name="injeung"><img src="/img/check.png" style="width: 25px;"></span>
            <input type="text" class="form-control" id="injeung" placeholder="  인증번호" aria-label="Username" aria-describedby="basic-addon1" required>
            <button type="button" class="input-group-text" onclick="injeungCheck()" id="injeungCheckbtn">인증번호 확인</button>
            <input type="hidden" id="isAuthorized" value="false">
        </div>
        <div class="btn_confirm mb-5 d-flex justify-content-center">
            <button type="button" class="btn border btn-mb mt-4" onclick="findingPW()" style="background-color: #ebebeb">비밀번호 찾기</button>
        </div>
    </div>
</body>
</html>