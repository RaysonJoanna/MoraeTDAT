function inquiryWrite(){
    let title = $('#title').val();
    let naeyong = $('#naeyong').val();

    let inquiryData = JSON.stringify({"title":title, "naeyong" : naeyong});

    $.ajax({
        type : 'POST',
        url: '/MoraeTDAT/inquiry/write-process',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : inquiryData,
        complete : function (){
            window.location.href = '/MoraeTDAT/inquiry'
        }
    });
}