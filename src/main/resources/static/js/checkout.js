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