// join.js
$(function(){                                                  
    $("#join").click(function(){
        if(!confirm("등록하시겠습니까?"))return;
        if(!checkEmail($("#mi_email").val())){
            alert("올바른 형식의 이메일을 입력해주세요.");
            return;
        }
        if($("#mi_pwd").val().length < 6){
            alert("비밀번호는 6자 이상이어야 합니다.");
            return;
        }
        if(!checkWhiteSpace($("#mi_pwd").val())){
            alert("비밀번호에는 공백을 사용할 수 없습니다.");
            return;
        }
        if($("#mi_pwd").val() != $("#mi_pwd_confirm").val()){
            alert("비밀번호가 일치하지 않습니다.")
            return;
        }
        if($("#mi_name").val().length < 2){
            alert("올바른 이름을 입력해주세요.");
            return;
        }
        if($("#mi_birth").val().length != 8){
            alert("생년월일은 8자로 입력해주세요.");
            return;
        }
        if(!checkWhiteSpace($("#mi_birth").val())){
            alert("생년월일에는 공백을 사용할 수 없습니다.");
            return;
        }
        if(!($("#mi_phone").val().length == 10 || $("#mi_phone").val().length == 11)){
            alert("휴대폰 번호를 올바르게 입력해주세요.");
            return;
        }
        if(!checkWhiteSpace($("#mi_phone").val())){
            alert("휴대폰번호에는 공백을 사용할 수 없습니다.");
            return;
        }
        let data = {
            mi_email:$("#mi_email").val(),
            mi_pwd:$("#mi_pwd").val(),
            mi_name:$("#mi_name").val(),
            mi_birth:$("#mi_birth").val(),
            mi_phone:$("#mi_phone").val(),
            mi_address:$("#mi_address").val(),
            mi_gen:$("#mi_gen").val(),
        }
        $.ajax({
            url:"/member/add",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(data){
                alert(data.message);
                if(data.status){
                    location.reload();
                }
            }
        })
    })

    function checkEmail(email){
        // let regex = /^([0-9a-zA-Z_\.-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        return email.match(regex) != null;
    }
    
    function checkWhiteSpace(text){
        let regex = /\s/g;
        return text.match(regex) == null;
    }
})