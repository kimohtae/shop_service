// cart.js

$(function(){
    $(".delete").click(function(){
        if(!confirm("장바구니에서 삭제하시겠습니까?"))return;
        let seq = $(this).attr("data-seq");
        $.ajax({
            url:"/api/product/cart/delete?seq="+seq,
            type:"patch",
            success:function(msg){
                alert(msg);
                location.reload();
            }
        })
    })
    
    $("#count_up, #count_down").click(function(){
        let $count_box = $(this).closest(".count").find(".count_box");
        let $price_box = $(this).closest(".list_item").find(".price_area").find(".price");
        let $point_box = $(this).closest(".list_item").find(".price_area").find(".point span:last-child");
        let $origin_box = $(this).closest(".list_item").find(".price_area").find(".origin");
        let limit = $(this).attr("data-stock");
        let cart_seq = $(this).attr("data-cart-seq");
        let cnt = $count_box.html();

        if($(this).attr("id")=="count_up"){
            if(limit==cnt){
                alert("최대 구매 가능 수는 "+limit+"개 입니다.")
            }else{
                cnt++;
                t_price += Number($(this).attr("data-price"));
            }
        }else{
            if(cnt!=1){
                cnt--;
                t_price -= Number($(this).attr("data-price"));
            }
        }
        $count_box.html(cnt);
        
        let total_price = Math.round($(this).attr("data-price") * cnt);
        let total_origin = Math.round($(this).attr("data-origin") * cnt);
        let total_point = Math.round($(this).attr("data-point") * cnt);
        let final_t_price = Math.round(t_price);
        let final_sum_price = Math.round((t_price+Number($(".total_di_price").attr("data-total-d-price"))));

        let regex = /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g; //숫자 3자리 마다
        let formatted_price = total_price.toString().replace(regex, ",");
        let formatted_origin = total_origin.toString().replace(regex, ",");
        let formatted_point = total_point.toString().replace(regex, ",");
        let formatted_t_price = final_t_price.toString().replace(regex, ",");
        let formatted_sum_price = final_sum_price.toString().replace(regex, ",");

        $price_box.html(formatted_price+"원")
        $origin_box.html(formatted_origin+"원")
        $point_box.html(formatted_point+"원")
        $(".total_price").html(formatted_t_price+"원");
        $(".sum_price").html(formatted_sum_price+"원");

        $(".increase, .decrease").prop("disabled", true);
        $.ajax({
            url:"/api/product/cart/count?seq="+cart_seq+"&count="+cnt,
            type:"patch",
            success:function(r){
                console.log(r);
                $(".increase, .decrease").prop("disabled", false);
            }
        })
    })
})