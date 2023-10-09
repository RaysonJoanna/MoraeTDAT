function cart(productnum, userid){
    let isdetail = 'no';
    if(userid==="" || userid==='null'){
        alert('로그인 후 사용가능합니다')
    } else{
        let cartdata = JSON.stringify({"productnum" : productnum, "isdetail":isdetail});
        $.ajax({
            type : 'POST',
            url: '/MoraeTDAT/shop/cart',
            async : true,
            dataType:'JSON',
            contentType: "application/json; charset=UTF-8",
            data : cartdata,
            success : function (data){
                if(data.addcart){
                    alert('장바구니에 넣었습니다');
                } else {
                    alert('장바구니에 넣는 데 실패했습니다');
                }
            }
        });
    }
}

function cartdetail(productnum, userid, option, amount){
    let isdetail = 'done';
    if(userid==="" || userid==='null'){
        alert('로그인 후 사용가능합니다')
    } else{
        let cartdata = JSON.stringify(
            {"productnum" : productnum,
            "productoption" : option,
            "isdetail":isdetail,
            "amount":amount});
        $.ajax({
            type : 'POST',
            url: '/MoraeTDAT/shop/cart',
            async : true,
            dataType:'JSON',
            contentType: "application/json; charset=UTF-8",
            data : cartdata,
            success : function (data){
                if(data.addcart){
                    alert('장바구니에 넣었습니다');
                } else {
                    alert('장바구니에 넣는 데 실패했습니다');
                }
            }
        });
    }
}

function heart(productnum, userid){
    if(userid==="" || userid==='null'){
        alert('로그인 후 사용가능합니다')
    } else{
        let heartdata = JSON.stringify({"productnum" : productnum});
        $.ajax({
            type : 'POST',
            url: '/MoraeTDAT/shop/heart',
            async : true,
            dataType:'JSON',
            contentType: "application/json; charset=UTF-8",
            data : heartdata,
            success : function (data){
                if(data.addheart){
                    alert('찜 했습니다');
                } else {
                    alert('찜 하는데 실패했습니다');
                }
            }
        });
    }
}

function searchByKeyword(category){
    let keyword = $('#search_bar').val();
    window.location.replace('/MoraeTDAT/shop/search?category='+category+'&keyword='+keyword);
}

$(function (){
    $('#search_bar').keydown(function(event){
        if(event.keyCode === 13){
            searchByKeyword($('#category').text());
        }
    })

    let category = $('#category').text();

    if(category == '검색결과' || category == '베스트' || category == '신상'
        || category == '할인상품' || category == '예약판매'){
        $('#shop_align').hide();
    }

})

function gaesuDown(){
    let amount = parseInt($('#gaesu').text());
    console.log(amount)
    console.log(typeof amount)
    if(amount>1){
        amount -= 1;
        $('#gaesu').text(amount);
    }
}

function gaesuUp(){
    let amount = parseInt($('#gaesu').text());
    amount +=1;
    $('#gaesu').text(amount);
}

function select_All(e){
    e.preventDefault();
    $('.historyCheck').prop("checked",true);
}

function part_delete(e){
    e.preventDefault();
    let data = "";
    $('input:checkbox[name=historyCheck]').each(function (index) {
        if($(this).is(":checked")==true){
            data += $(this).prev()[0].innerText+",";
        }
    });

    let deleteData = JSON.stringify({"deleteData":data.substring(0,data.length-1)});

    $.ajax({
        type : 'POST',
        url: '/MoraeTDAT/shop/cartpage?gubun=part-delete',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : deleteData,
        complete : function (){
            alert("삭제되었습니다");
            location.reload();
        }
    });
}

function part_deleteH(e){
    e.preventDefault();
    let data = "";
    $('input:checkbox[name=historyCheck]').each(function (index) {
        if($(this).is(":checked")==true){
            data += $(this).prev()[0].innerText+",";
        }
    });

    let deleteData = JSON.stringify({"deleteData":data.substring(0,data.length-1)});

    $.ajax({
        type : 'POST',
        url: '/MoraeTDAT/shop/heartpage?gubun=part-delete',
        async : true,
        dataType:'JSON',
        contentType: "application/json; charset=UTF-8",
        data : deleteData,
        complete : function (){
            alert("삭제되었습니다");
            location.reload();
        }
    });
}

function orderhit(c){

    let category = c;
    let gijun= "popular" ;

    window.location.href = '/MoraeTDAT/shop/order?category='+c+'&gijun='+gijun;
}

function orderlowprice(c){

    let category = c;
    let gijun = "lowprice";

    window.location.href = '/MoraeTDAT/shop/order?category='+c+'&gijun='+gijun;
}