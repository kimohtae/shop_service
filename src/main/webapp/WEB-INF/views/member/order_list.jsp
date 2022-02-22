<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/member/order_list.css">
</head>
<body>
    <main>
        <div class="content_wrap">
            <h1>주문 목록</h1>
            <div class="list_area">
                <c:forEach items="${list}" var="item">
                    <div class="item">
                        <div class="item_left">
                            <div class="delivery_status">
                                <p>
                                    <c:if test="${item.oi_delivery_status == 0}">
                                        <span>배송준비중</span>
                                    </c:if>
                                    <c:if test="${item.oi_delivery_status == 1}">
                                        <span>배송중</span>
                                    </c:if>
                                    <c:if test="${item.oi_delivery_status == 2}">
                                        <span>배송완료</span>
                                    </c:if>
                                    <c:if test="${item.oi_delivery_status == 2}">
                                        <span>
                                            <fmt:formatDate value="${item.oi_mod_dt}" pattern="yyyy.MM.dd"/> 도착
                                        </span>
                                    </c:if>
                                </p>
                            </div>
                            <div class="product_info">
                                <div class="prod_img" style="background-image:url(http://localhost:8756/image/product/${item.img})"></div>
                                <div class="prod_text">
                                    <a href="/product/detail?index=${item.pi_seq}" target="_blank">${item.pi_name}</a>
                                    <p>
                                        <fmt:formatNumber value="${item.oi_price}" pattern="###,###,###"/>원 / ${item.oi_count}개
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="item_right">
                            <a href="#">배송조회</a>
                            <a href="#">교환·반품신청</a>
                            <c:if test="${item.oi_delivery_status == 2 && item.r_able}">
                                <a href="/member/review?product=${item.pi_seq}&order=${item.oi_seq}">리뷰작성</a>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="pager_area">
                <c:forEach begin="1" end="${page}" var="i">
                    <a href="/member/order_list?offset=${(i-1)*10}" class="pager">${i}</a>
                </c:forEach>
            </div>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>