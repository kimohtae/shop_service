// detail.js
$(function(){
// alert(product_price+","+ product_stock+","+ product_point)
let cnt = 1;
$("#count_up, #count_down").click(function(){
    
    if($(this).attr("id")=="count_up"){
        // let count = $(".count_box").html();
        // count++;
        // if(count > product_stock) count = product_stock;
        // $(".count_box").html(count);
        if(product_stock>cnt){
            cnt++;
            $(".count_box").html(cnt);
            let total_price = Math.round(product_price * cnt);
            let total_point = Math.round(product_point * cnt);
            let regex = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g; //숫자 3자리 마다
            
            let formatted_price = total_price.toString().replace(regex, ",");
            let formatted_point = total_point.toString().replace(regex, ",");
            
            $(".total_price span").html(formatted_price)
            $(".total_save span:last-child").html(formatted_point)
        }
    }else{
        // let count = $(".count_box").html();
        // count--;
        // if(count <= 0) count=1;
        // $(".count_box").html(count);
        if(1<cnt){    
        cnt--;
        $(".count_box").html(cnt);
        let total_price = Math.round(product_price * cnt);
        let total_point = Math.round(product_point * cnt);
        let regex = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g; //숫자 3자리 마다
        
        let formatted_price = total_price.toString().replace(regex, ",");
        let formatted_point = total_point.toString().replace(regex, ",");
        
        $(".total_price span").html(formatted_price)
        $(".total_save span:last-child").html(formatted_point)
        }
    }
})

$("#shopping_bag").click(function(){
    // alert(member_seq +","+ prod_seq+","+cnt);
    if(member_seq == null || member_seq == ""){
        location.href = "/member/login";
        return;
    }
    let data = {
        scd_mi_seq:member_seq,
        scd_pi_seq:prod_seq,
        scd_count:cnt
    }
    $.ajax({
        url:"/api/product/cart",
        type:"put",
        data:JSON.stringify(data),
        contentType:"application/json",
        success:function(r){
            alert(r.message);
            // if(confirm(r.message + " 장바구니로 이동하시겠습니까?"))location.href="/member/cart";
            $.ajax({
                url:"/api/product/cart/count?member_seq="+member_seq,
                type:"get",
                success:function(r){
                    $(".cart_badge").html(r);
                    if(r != 0){
                        $(".cart_badge").css("display","inline-block")
                    }
                }
            })
        }
    })
})



})
