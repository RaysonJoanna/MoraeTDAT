function login() {
    let loginData = JSON.stringify({
        "id" : $('#id').val(),
        "pw" : $('#pw').val(),
        "memory_id" : $('#memory_id').val()
    })
    $.ajax({
        type : 'POST',
        url : '/MoraeTDAT/login/process',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : loginData,
        success: function(data) {
            if(data.login){
                alert(`${data.id}님 반갑습니다 :)`);
                window.location.href = '/MoraeTDAT/home';
            } else {
                alert('로그인에 실패했습니다.');
            }
        }
    });
}

//아이디 저장 기능
$(function(){
    // 저장된 쿠키값ㅇ르 가져와 ID칸에 넣기
    let memoried_ID = getCookie("memoried_ID");
    $('#id').val(memoried_ID);

    //아이디 값이 입력되면 아이디 저장 체크박스 체크하기
    if($('#id').val() != ''){
        $('#memory_id').attr('checked',true);
    }

    $('#memory_id').change(function(){
        if($("#memory_id").is(':checked')){
            let memoried_ID = $('#id').val();
            setCookie("memoried_ID", memoried_ID, 30); //한달간 보관
        } else {
            deleteCookie('memoried_ID');
        }
    });

    $('#id').keyup(function(){
        if($('#memory_id').is(':checked')){
            let memoried_ID = $('#id').val();
            setCookie("memoried_ID",memoried_ID,30);
        }
    })
})

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

function find_id_popup() {
    let popupX = window.screen.width / 2 - 300;
    let popupY = window.screen.height / 2 - 350;
    let option = 'width=600, height=580, top='+popupY+', left='+popupX+', location=no';
    window.open("/MoraeTDAT/login/find-id", "MoraeTDAT", option); //url 변경
}

function findingID(){
    let email = $('#useremail').val();
    let phone = $('#userphone').val();

    let findData = JSON.stringify({"email":email, "phone":phone});

    $.ajax({
        type : 'POST',
        url : '/MoraeTDAT/login/finding',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : findData,
        success: function(data) {
            if(data.userid !== ""){
                alert("아이디는 "+data.userid+"입니다.");
            } else {
                alert("해당 정보의 아이디가 없습니다.")
            }
        }
    });
}

function find_pw_popup(){
    let popupX = window.screen.width / 2 - 300;
    let popupY = window.screen.height / 2 - 350;
    let option = 'width=600, height=580, top='+popupY+', left='+popupX+', location=no';
    window.open("/MoraeTDAT/login/find-pw", "MoraeTDAT", option); //url 변경
}
function randomNum(n) {
    let str = ''
    for (let i = 0; i < n; i++) {
        str += Math.floor(Math.random() * 10)
    }
    return str
}

let authorizationNum = randomNum(6);
console.log(authorizationNum);

function injeungCheck() {
    if($('#injeung').val()==authorizationNum){
        $('#isAuthorized').val("true");
        alert('인증 완료되었습니다');
    }
}

function findingPW(){
    let userid = $('#userid').val();
    let phone = $('#userphone').val();

    let findData = JSON.stringify({"userid":userid, "phone":phone});

    $.ajax({
        type : 'POST',
        url : '/MoraeTDAT/login/findingPW',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : findData,
        success: function(data) {
            if(data.userpw !== ""){
                alert("비밀번호는 "+data.userpw+"입니다.");
            } else {
                alert("해당 정보의 비밀번호가 없습니다.")
            }
        }
    });
}