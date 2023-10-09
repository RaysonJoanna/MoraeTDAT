
function register() {

    // 데이터 변수화
    let id = $('#userid').val();
    let pw = $('#userpw').val();
    let pwCheck = $('#pwCheck').val();
    let phoneNumber = $('#userphone').val();
    let email = $('#useremail').val();
    let userzcode = $('#userzcode').val();
    let address = $('#address').val();
    console.log(address);
    let detailaddress = $('#detailAddress').val();
    let useraddr = `${address} ${detailaddress}`;

    // 정규표현식
    let checkid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/   //영어,숫자 포함 8~25자리
    let checkpw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,25}$/; //영어,숫자,특수기호 포함 8~25자리
    let checkphone = /^010-?([0-9]{4})-?([0-9]{4})$/;   //010-숫자4개-숫자4개
    let checkemail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$/;   //영어나숫자나@영어나숫자나.영어
    let checkzcode = /^[0-9]+$/;

    // 아이디 유효성 검사
    if(!checkid.test(id)){
        alert("아이디는 영어,숫자를 포함해 8~25자리로 입력해주세요.");
        $('#userid').focus();
        return false;
    }

    // 아이디 중복 검사
    if($('#idtestResult').val()==1){
        alert("중복된 아이디는 사용할 수 없습니다.");
        $('#userid').focus();
        return false;
    }

    // 비밀번호 유효성 검사
    if(!checkpw.test(pw)){
        alert("비밀번호는 영어,숫자,특수문자를 포함해 8~25자리로 입력해주세요.");
        $('#userpw').focus();
        return false;
    } else if(pw !== pwCheck){
        alert("비밀번호가 같지 않습니다. 다시 입력해주세요.");
        $('#pwCheck').focus();
        return false;
    }

    //전화번호 유효성 검사
    if(!checkphone.test(phoneNumber)){
        alert("전화번호가 양식에 맞지 않습니다. 다시 입력해주세요.");
        $('#userphone').focus();
        return false;
    }

    //우편번호 유효성 검사
    if(!checkzcode.test(parseInt(userzcode))){
        alert("우편번호는 숫자로 입력해주세요.")
        $('.zbtn').focus();
        return false;
    }

    // 상세주소 빈칸 검사
    if(detailaddress == ""){
        alert("상세주소를 입력해주세요.");
        $('#detailAddress').focus();
        return false;
    }

    //이메일 유효성 검사
    if(!checkemail.test(email)){
        alert("이메일이 양식에 맞지 않습니다. 다시 입력해주세요.");
        $('#useremail').focus();
        return false;
    }

    let regiData = JSON.stringify({
        "userid" : id,
        "userpw" : pw,
        "userphone" : phoneNumber,
        "useremail" : email,
        "userzcode" : userzcode,
        "useraddr" : useraddr
    });

    $.ajax({
        type: 'POST',
        url: '/MoraeTDAT/register/process',
        async: true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data: regiData,
        success: function (data){
            if(data.registered) {
                window.location.href = '/MoraeTDAT/login';
            } else {
                alert('회원가입에 실패했습니다.');
            }
        },
        error : function (request){
            console.log(JSON.stringify(request));
        }
    });
}

function testid(){
    // 데이터 JSON처리
    let id = $('#userid').val();
    let sendData = JSON.stringify({"idtest":id});

    $.ajax({
        type:'POST',
        url : '/MoraeTDAT/register/idtest',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : sendData,
        success:function(data) {
            // 아이디가 중복이 아니면
            if(data.test === "OK") {
                // 메세지를 2.5초간 보여주고 숨김
                $('#testOK').show(function(){
                    setTimeout(function(){
                        $('#testOK').hide();},2500);
                });
                // 중복검사결과 hidden 인풋에 적용
                $('#idtestResult').val(0);

            //아이디가 중복이면
            } else {
                // 메세지 2.5초간 보여주고 숨김
                $('#testNO').show(function(){
                    setTimeout(function(){
                        $('#testNO').hide();},2500);
                });
                //아아디 입력칸에 focust하고 hidden인풋에 값 적용
                $('#userid').focus();
                $('#idtestResult').val(1);
            }
        },
        error:function (data){
            console.log(data);
        }
    });
}