function changePW() {
    let popupX = window.screen.width / 2 - 300;
    let popupY = window.screen.height / 2 - 350;
    let option = 'width=600, height=580, top='+popupY+', left='+popupX+', location=no';
    window.open("/MoraeTDAT/mypage/changePW", "MoraeTDAT", option); //url 변경
}

function changePhone() {
    let popupX = window.screen.width / 2 - 300;
    let popupY = window.screen.height / 2 - 350;
    let option = 'width=600, height=580, top='+popupY+', left='+popupX+', location=no';
    window.open("/MoraeTDAT/mypage/changePhone", "MoraeTDAT", option); //url 변경
}

function changeEmail() {
    let popupX = window.screen.width / 2 - 300;
    let popupY = window.screen.height / 2 - 350;
    let option = 'width=600, height=580, top='+popupY+', left='+popupX+', location=no';
    window.open("/MoraeTDAT/mypage/changeEmail", "MoraeTDAT", option); //url 변경
}

function injeungCheck(){
    if($('#injeung')){
        $('#isAuthorized').val('true');
        alert('인증되었습니다');
    }
}

function changingPW(){
    if($('#userpw').val()==$('#pwCheck').val()){
        opener.document.getElementById("ischangePw").value = $('#pwCheck').val();
        alert('비밀번호 변경되었습니다. 변경사항 저장을 눌러야 저장됩니다');
        window.close();
    }
}

function changingPhone(){
    if($('#isAuthorized').val()=='true'){
        opener.document.getElementById("ischangePhone").value = $('#userphone').val();
        alert('전화번호가 변경되었습니다. 변경사항 저장을 눌러야 저장됩니다');
        window.close();
    }
}

function changingEmail(){
    if($('#isAuthorized').val()=='true'){
        opener.document.getElementById("ischangeEmail").value = $('#useremail').val();
        alert('이메일이 변경되었습니다. 변경사항 저장을 눌러야 저장됩니다');
        window.close();
    }
}

function changeSave(){
    let changedPW = $('#ischangePw').val();
    let changedPhone = $('#ischangePhone').val();
    let changedEmail = $('#ischangeEmail').val();

    let changeData = JSON.stringify({
        "changedPW":changedPW,
        "changedPhone":changedPhone,
        "changedEmail":changedEmail
    })

    $.ajax({
        type : 'POST',
        url: '/MoraeTDAT/mypage/changefinish',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : changeData,
        success : function (data){
            if(data.changed){
                alert('변경사항이 저장되었습니다');
            } else
                alert('변경사항이 저장되지 않았습니다')
        }
    });

}