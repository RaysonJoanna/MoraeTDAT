function reply(){
    let content = $('#replyContent').val();
    let inquirynum = $('#inquirynum').text();

    let contentData = JSON.stringify({
        "content": content,
        "inquirynum" : inquirynum
    });
        $.ajax({
            type : 'POST',
            url: '/MoraeTDAT/admin/inquiry/reply',
            async : true,
            dataType:'JSON',
            contentType: "application/json; charset=UTF-8",
            data : contentData,
            success : function (data){
                if(data.reply){
                    alert('답변 저장되었습니다')
                    window.location.href = '/MoraeTDAT/admin/inquiry';
                } else alert('답변 저장 실패');
            }
        });
}