// checkout.js
$(function(){
    $("#purchase").click(function(){
        let dataArray = new Array();
        for(let i=0; i<$("#product_info tbody tr").length; i++){
            let data = {
                "oi_pi_seq": $("#product_info tbody tr").eq(i).attr("data-pi-seq"),
                "oi_mi_seq": $(this).attr("data-mi-seq"),
                "oi_price": Number($("#product_info tbody tr").eq(i).attr("data-price")),
                "oi_count": $("#product_info tbody tr").eq(i).attr("data-count"),
                "oi_shipping_name": $("#shipping_name").val(),
                "oi_shipping_address": $("#shipping_addr").val(),
                "oi_shipping_phone": $("#shipping_phone").val(),
                "oi_shipping_request": $("#shipping_request").val(),
                "oi_pay_type": $(".payment_type input:checked").val(),
                "delivery_price": $("#product_info tbody tr").eq(i).attr("data-di-price")
            }
            dataArray.push(data);
        }
        $.ajax({
            url:"/api/order/add",
            type:"put",
            data:JSON.stringify(dataArray),
            contentType:"application/json",
            success:function(r){
                location.href="/";
                alert(r.message);
            },
            error:function(e){
                alert(e.responseJSON.message);
            }
        })
    })
    
})