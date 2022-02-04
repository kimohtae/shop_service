<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <script src="/assets/plugins/jquery-3.4.1.min.js"></script>
</head>
<body>
    <header>
        <div class="header_top">
            <div class="user_menu">
                <c:if test="${login_user == null}">
                    <a href="/member/login">로그인</a>
                    <a href="/member/join">회원가입</a>
                </c:if>
                <c:if test="${login_user != null}">
                    <a href="/member/detail?seq=${login_user.mi_seq}"><b>${login_user.mi_name}</b>님</a>
                    <a href="/member/logout">로그아웃</a>
                </c:if>
            </div>
        </div>
        <nav id="gnb"></nav>
    </header>
</body>
</html>