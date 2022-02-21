<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/order/checkout.css">
    <script src="/assets/js/order/checkout.js"></script>


</head>
<body>
    <main>
        <div class="content_wrap">
            <h1>주문 / 결제</h1>
            <h2>주문자 정보</h2>
            <table id="basic_info" data-mi-seq="${login_user.mi_seq}">
                <tbody>
                    <tr>
                        <td class="td_title">이름</td>
                        <td>${login_user.mi_name}</td>
                    </tr>
                    <tr>
                        <td class="td_title">이메일</td>
                        <td>${login_user.mi_email}</td>
                    </tr>
                    <tr>
                        <td class="td_title">전화번호</td>
                        <td>${login_user.mi_phone}</td>
                    </tr>
                </tbody>
            </table>
            <h2>배송지 정보</h2>
            <table id="shipping_info">
                <tbody>
                    <tr>
                        <td class="td_title">이름</td>
                        <td>
                            <input type="text" id="shipping_name" value="${login_user.mi_name}">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_title">주소</td>
                        <td>
                            <input type="text" id="shipping_addr" value="${login_user.mi_address}">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_title">연락처</td>
                        <td>
                            <input type="text" id="shipping_phone" value="${login_user.mi_phone}">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_title">배송시 요청사항</td>
                        <td>
                            <input type="text" id="shipping_request" value="예시) 경비실에 맡겨주세요.">
                        </td>
                    </tr>
                </tbody>
            </table>
            <h2>주문 상품 정보</h2>
            <table id="product_info">
                <thead>
                    <tr>
                        <td colspan="3">주문 상품 정보</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${order_items}" var="item">
                        <tr data-pi-seq="${item.pi_seq}" data-price="${item.discounted_price}" data-count="${item.scd_count}" data-di-price="${item.di_price}">
                            <td><a href="/product/detail?index=${item.pi_seq}" target="_blank">[${item.mfi_name}] ${item.pi_name}</a></td>
                            <td>${item.scd_count}개</td>
                            <td>${item.di_name} / ${item.di_price}원</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h2>결제 정보</h2>
            <table id="payment_info">
                <tr>
                    <td class="td_title">총상품가격</td>
                    <td>
                        <fmt:formatNumber value="${prod_price}" pattern="###,###,###"/>원
                    </td>
                </tr>
                <tr>
                    <td class="td_title">총 배송비</td>
                    <td>
                        <fmt:formatNumber value="${delivery_price}" pattern="###,###,###"/>원    
                    </td>
                </tr>
                <tr>
                    <td class="td_title">총 결제금액</td>
                    <td>
                        <fmt:formatNumber value="${total_price}" pattern="###,###,###"/>원
                    </td>
                </tr>
                <tr>
                    <td class="td_title">결제 방법</td>
                    <td class="payment_type">
                        <input type="radio" id="account" name="pay" value="account" checked>
                        <label for="account">계좌이체</label>
                        <input type="radio" id="card" name="pay" value="card">
                        <label for="card">신용카드</label>
                        <input type="radio" id="kakao" name="pay" value="kakao">
                        <label for="kakao">카카오페이</label>
                        <input type="radio" id="naver" name="pay" value="naver">
                        <label for="naver">네이버페이</label>
                        <input type="radio" id="toss" name="pay" value="toss">
                        <label for="toss">토스</label>
                        <br>
                        <input type="checkbox" checked id="agreement">
                        <label for="agreement">구매조건을 확인하였고, 결제대행 서비스에 동의합니다.</label>
                    </td>
                </tr>
            </table>
            <div class="btn_area">
                <a href="/member/cart">돌아가기</a>
                <button id="purchase" data-mi-seq="${login_user.mi_seq}">주문완료</button>
            </div>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>