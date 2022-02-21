// header.js

$(function(){
    if(member_seq != null && member_seq != ""){
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
    }else{
        $(".cart_badge").css("display","none")
    }

    let root_cate_index;
    $.ajax({
        url:"/api/category/get",
        type:"get",
        success:function(r){
            for(let i=0; i<r.categories.length; i++){
                // console.log(r.categories[i]);
                let root_tag = '<li><a href="/product/list?category='+r.categories[i].seq+'">'+r.categories[i].name+'</a></li>'
                $(".cate_list").append(root_tag);
                $(".sub_1_area").append('<ul class="sub'+i+'"></ul>')
                if(r.categories[i].sub != undefined){
                    for(let j=0; j<r.categories[i].sub.length; j++){
                        // console.log(r.categories[i].sub[j]);
                        let sub1_tag = '<li><a href="/product/list?category='+r.categories[i].sub[j].seq+'">'+r.categories[i].sub[j].name+'</a></li>'
                        $(".sub_1_area .sub"+i).append(sub1_tag);
                        $(".sub_2_area").append('<ul class="sub'+i+j+'"></ul>')
                        if(r.categories[i].sub[j].sub != undefined){
                            for(let k=0; k<r.categories[i].sub[j].sub.length; k++){
                                let sub2_tag = '<li><a href="/product/list?category='+r.categories[i].sub[j].sub[k].cate_seq+'">'+r.categories[i].sub[j].sub[k].cate_name+'</a></li>'
                                $(".sub_2_area .sub"+i+j).append(sub2_tag);
                            }
                        }
                        
                    }
                }
            }
            $("#gnb .cate_list a").mouseover(function(){
                $(".sub_area").css("width","180px").css("display","block")
                let index = root_cate_index = $(this).parent().index();
                // console.log(index)
                let selector = ".sub_1_area .sub"+index;
                // console.log(selector)
                $(".sub_1_area ul").css("display","")
                $(selector).css("display","block")
            })
            $(".sub_area").mouseover(function(){
                $("#gnb .cate_list").css("display","block");
            })
            $(".sub_1_area a").mouseover(function(){
                $(".sub_area").css("width","360px")
                let index= $(this).parent().index();
                // console.log(root_cate_index ,index);
                let selector = ".sub_2_area .sub"+root_cate_index+index;
                $(".sub_2_area ul").css("display","")
                $(selector).css("display","block")
            })
        }
    })

    $(".category_btn, #gnb .cate_list").mouseover(function(){
        $("#gnb .cate_list").css("display","block");
    })
    $(".sub_2_area").mouseover(function(){
        $(".sub_area").css("width","360px")
    })
    $(".sub_2_area").mouseleave(function(){
        $(".sub_area").css("width","180px")
    })
    $(".sub_1_area").mouseleave(function(){
        $(".sub_area").css("width","0")
    })
    
    $(".category_btn, #gnb").mouseleave(function(){
        $("#gnb .cate_list").css("display","");
        $(".sub_area").css("width","0").css("display","")
    })


})