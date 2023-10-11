$(function (){
    $('#jumunjainfo').change(function (){
        if($("#jumunjainfo").is(':checked')) {
            let id = $('#sessionID').val();
            let data = JSON.stringify({"id": id});
            $.ajax({
                type: 'POST',
                url: '/MoraeTDAT/checkout/getuserinfo',
                async: true,
                dataType: 'JSON',
                contentType: "application/json; charset=UTF-8",
                data: data,
                success: function (data) {
                    $('#jumunjanumber').val(data.loginuser.userphone);
                    $('#jumunjaemail').val(data.loginuser.useremail);
                }
            });
        }
    });

    $('#orderinfo').change(function (){
        if($("#orderinfo").is(':checked')) {
            $('#ordername').val($('#jumunjaname').val());
            $('#ordernumber').val($('#jumunjanumber').val());
        }
    });
});

function checkout(){
    alert("결제가 완료되었습니다.");

    let gubun = [];
    $('.gubun').each(function() {
        gubun.push($(this).text());
    });

    if(gubun[0] == "detail"){
        let num = [];
        $('.dnum').each(function() {
            num.push($(this).text());
        });


        let quantity = $('.dquantity').text();
        let ordername  = $('#jumunjaname').val();
        let orderphone  = $('#jumunjanumber').val();
        let orderemail  = $('#jumunjaemail').val();
        let deliverphone = $('#ordernumber').val();
        let deliverzcode  = $('#zonecode').val();
        let deliveraddr  = $('#address').val()+" "+$('#detailAddress').val();
        let delivername  = $('#ordername').val();

        let checkoutData = JSON.stringify({
            "gubun":gubun,
            "num":num,
            "ordername":ordername,
            "orderphone":orderphone,
            "orderemail":orderemail,
            "deliverphone":deliverphone,
            "deliverzcode":deliverzcode,
            "deliveraddr":deliveraddr,
            "delivername":delivername,
            "quantity":quantity
        });

        $.ajax({
            type: 'POST',
            url: '/MoraeTDAT/checkout/finish',
            async: true,
            dataType: 'JSON',
            contentType: "application/json; charset=UTF-8",
            data: checkoutData,
            success: function (data) {
                if (data.checkoutSuccess) {
                    window.location.href = '/MoraeTDAT/home';
                }
            }
        });
    } else if(gubun[0] == "cart"){
        let num = [];
        $('.cnum').each(function() {
            num.push($(this).text());
        });

        let quantity = [];
        $('.cquantity').each(function() {
            quantity.push($(this).text());
        });

        let ordername  = $('#jumunjaname').val();
        let orderphone  = $('#jumunjanumber').val();
        let orderemail  = $('#jumunjaemail').val();
        let deliverphone = $('#ordernumber').val();
        let deliverzcode  = $('#zonecode').val();
        let deliveraddr  = $('#address').val()+" "+$('#detailAddress').val();
        let delivername  = $('#ordername').val();

        let checkoutData = JSON.stringify({
            "gubun":gubun,
            "num":num,
            "ordername":ordername,
            "orderphone":orderphone,
            "orderemail":orderemail,
            "deliverphone":deliverphone,
            "deliverzcode":deliverzcode,
            "deliveraddr":deliveraddr,
            "delivername":delivername,
            "quantity":quantity
        });

        $.ajax({
            type: 'POST',
            url: '/MoraeTDAT/checkout/finish',
            async: true,
            dataType: 'JSON',
            contentType: "application/json; charset=UTF-8",
            data: checkoutData,
            success: function (data) {
                if(data.checkoutSuccess){
                    window.location.href = '/MoraeTDAT/home';
                }
            }
        });
    }
}