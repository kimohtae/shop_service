<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/member/join.css">
    <script src="/assets/js/join.js"></script>
</head>
<body>
    <main>
        <div class="join_form">
            <h1>회원가입</h1>
            <span>User Email</span>
            <input type="text" id="mi_email" placeholder="사용자 이메일">
            <span>Password</span>
            <input type="password" id="mi_pwd" placeholder="비밀번호">
            <span>Password Confirm</span>
            <input type="password" id="mi_pwd_confirm" placeholder="비밀번호 확인">
            <span>User Name</span>
            <input type="text" id="mi_name" placeholder="이름">
            <span>Birthday</span>
            <input type="text" id="mi_birth" placeholder="생년월일 (20220204)">
            <span>Gender</span>
            <select id="mi_gen">
                <option value="0">선택안함</option>
                <option value="1">남자</option>
                <option value="2">여자</option>
            </select>
            <span>Cell Phone Number</span>
            <input type="text" id="mi_phone" placeholder="전화번호 (01012345678)">
            <span>Address</span>
            <input type="text" id="mi_address" placeholder="주소">
            <button id="join"><i class="fas fa-sign-in"></i> 회원가입</button>
            <button id="cancel"><i class="fas fa-times"></i> 취소</button>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>