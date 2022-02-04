<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        if("${login_status}" != 'success' && "${login_status}" != ''){
            alert("${login_status}");
        }
    </script>
</head>
<body>
    <main>
        <div class="login_form">
            <h1>로그인</h1>
            <form action="/member/login" method="post">
                <p>User Account</p>
                <input type="text" id="user_email" name="user_email" placeholder="이메일을 입력해주세요">
                <p>User Password</p>
                <input type="password" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력해주세요">
                <button type="submit">로그인</button>
            </form>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>