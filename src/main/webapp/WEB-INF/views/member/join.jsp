<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/assets/js/join.js"></script>
</head>
<body>
    <main>
        <div class="join_form">
            <p>User Email</p>
            <input type="text" id="mi_email" placeholder="이메일">
            <p>Password</p>
            <input type="password" id="mi_pwd" placeholder="비밀번호">
            <p>Password Confirm </p>
            <input type="password" id="mi_pwd_confirm" placeholder="비밀번호 확인">
            <p>User Name</p>
            <input type="text" id="mi_name" placeholder="이름">
            <p>Birthday</p>
            <input type="text" id="mi_birth" placeholder="생년월일 ex)20120503">
            <p>Gender</p>
            <select id="mi_gen">
                <option value="0">여자</option>
                <option value="1">남자</option>
            </select>
            <p>Cell Phone Number</p>
            <input type="text" id="mi_phone" placeholder="전화번호  '-' 제외">
            <p>Address</p>
            <textarea type="text" id="mi_address" placeholder="주소"></textarea>
            <button id="join">회원가입</button>
            <button id="cancel">취소</button>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>