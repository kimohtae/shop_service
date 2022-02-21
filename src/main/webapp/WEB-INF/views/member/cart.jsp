<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/member/cart.css">
    <script>
        let t_price = Number("${total_price}");
    </script>
    <script src="/assets/js/member/cart.js"></script>
</head>
<body>
    <main>
        <div class="title_area">
            <h1>
                <i class="fas fa-shopping-cart"></i>
                <span>장바구니</span>
            </h1>
        </div>
        <section class="content_area">
            <div class="list_area">
                <c:if test="${list.size() == 0}">
                    <div class="empty_item">
                        <h2>장바구니에 담긴 상품이 없습니다.</h2>
                        <a href="/">추천상품 쇼핑하러 가기</a>
                    </div>
                </c:if>
                <c:forEach items="${list}" var="item">
                    <div class="list_item">
                        <div class="chk_area">
                            <input type="checkbox" value="${item.scd_seq}" class="cart_item_chk" checked>
                        </div>
                        <div class="info_area">
                            <div class="img_box" style="background-image: url(http://localhost:8756/image/product/${item.thumbnail});"></div>
                            <div class="text_box">
                                <div class="seller">
                                    <div class="seller_pf_img" style="background-image: url(http://localhost:8756/image/seller/${item.si_img_url})"></div>
                                    <p>${item.si_name}</p>
                                </div>
                                <a href="/product/detail?index=${item.pi_seq}">[${item.mfi_name}] ${item.pi_name}</a>
                            </div>
                        </div>
                        <div class="price_area">
                            <p class="price"><fmt:formatNumber value="${item.discounted_price * item.scd_count}" pattern="###,###,###"/>원</p>
                            <c:if test="${item.discounted_price != item.pi_price}">
                                <p class="origin"><fmt:formatNumber value="${item.pi_price * item.scd_count}" pattern="###,###,###"/>원</p>
                            </c:if>
                            <c:if test="${item.saving_point != 0}">
                                <p class="point">
                                    <span>적립</span>
                                    <span><fmt:formatNumber value="${item.saving_point * item.scd_count}" pattern="###,###,###"/>원</span>
                                </p>
                            </c:if>
                        </div>
                        <div class="delivery_price_area">
                            <p>${item.di_name}</p>
                            <p><fmt:formatNumber value="${item.di_price}" pattern="###,###,###"/>원</p>
                        </div>
                        <div class="cnt_area">
                            <div class="count">
                                <div class="count_box">${item.scd_count}</div>
                                <div class="count_btns" >
                                    <button class="increase" id="count_up"
                                        data-price="${item.discounted_price}" 
                                        data-origin="${item.pi_price}" 
                                        data-point="${item.saving_point}" 
                                        data-stock="${item.pi_stock}" 
                                        data-cart-seq="${item.scd_seq}" 
                                        data-seq="${item.pi_seq}"
                                        ><i class="fas fa-chevron-up"></i>
                                    </button>
                                    <button class="decrease" id="count_down"
                                        data-price="${item.discounted_price}" 
                                        data-origin="${item.pi_price}" 
                                        data-point="${item.saving_point}" 
                                        data-stock="${item.pi_stock}" 
                                        data-cart-seq="${item.scd_seq}" 
                                        data-seq="${item.pi_seq}"
                                        ><i class="fas fa-chevron-down"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="cart_btn_area">
                            <button class="delete" data-seq="${item.scd_seq}">
                                <i class="fas fa-trash-alt"></i>
                                <span>삭제</span>
                            </button>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${list.size() != 0}">
                    <div class="total_price_area">
                        <p>
                            <span class="pa_title">상품가격</span>
                            <span class="total_price"><fmt:formatNumber value="${total_price}" pattern="###,###,###"/>원</span>
                            <span>
                                <i class="fas fa-plus"></i>
                            </span>
                            <span class="pa_symbol">배송비</span>
                            <span class="total_di_price" data-total-d-price="${total_d_price}">
                                <fmt:formatNumber value="${total_d_price}" pattern="###,###,###"/>원
                            </span>
                            <span>
                                <i class="fas fa-equals"></i>
                            </span>
                            <span class="pa_symbol">합계금액</span>
                            <span class="sum_price"><fmt:formatNumber value="${total_price + total_d_price}" pattern="###,###,###"/>원</span>
                        </p>
                    </div>
                    <div class="btn_area">
                        <a href="/">계속 쇼핑하기</a>
                        <a href="/order/checkout">구매하기</a>
                    </div>
                </c:if>
            </div>
        </section>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>