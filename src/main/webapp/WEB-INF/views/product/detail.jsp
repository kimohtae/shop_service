<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/assets/css/product/detail.css"/>
    <script>
        let product_price = "${item.discounted_price}";
        let product_stock = "${item.pi_stock}";
        let product_point = "${item.saving_point}";
        let prod_seq = "${item.pi_seq}";
    </script>
    <script src="/assets/js/product/detail.js"></script>
</head>
<body>
    <main>
        <section class="item_basic_area">
            <div class="item_basic_wrap">
                <div class="item_img_area">
                    <c:forEach items="${item_img}" var="img">
                        <c:if test="${img.pii_thumb}">
                            <div class="item_img_big" style="background-image: url(http://localhost:8756/image/product/${img.pii_img_url});"></div>
                        </c:if>
                    </c:forEach>
                    <div class="item_img_list">
                        <c:forEach items="${item_img}" var="img">
                            <div class="item_img_small" style="background-image: url(http://localhost:8756/image/product/${img.pii_img_url});"></div>
                        </c:forEach>
                    </div>
                </div>
                <div class="item_info_area">
                    <div class="basic_info">
                        <div class="seller_info">
                            <div class="seller_img" style="background-image: url(http://localhost:8756/image/seller/${item.si_img_url});"></div>
                            <p>${item.si_name}</p>
                        </div>
                        <h2 class="item_name">[${item.mfi_name}] ${item.pi_name}</h2>
                        <c:if test="${pi_sub_title != ''}">
                            <p class="item_sub_title">${item.pi_sub_title}</p>
                        </c:if>
                        <c:if test="${item.pi_discount_rate != 0}">
                            <p class="discount_title">할인가</p>
                            <p class="discount_price">
                                <b><fmt:formatNumber value="${item.discounted_price}" pattern="###,###,###"/>원</b>
                                <span class="discount_rate"><fmt:formatNumber value="${item.pi_discount_rate}" pattern="###.#"/>%</span>
                            </p>
                            <p class="origin_price">
                                <fmt:formatNumber value="${item.pi_price}" pattern="###,###,###"/>원
                            </p>
                            <c:if test="${item.pi_point_rate != 0}">
                                <p class="saving_point">
                                    <span>적립 <fmt:formatNumber value="${item.pi_point_rate}" pattern="###.#"/>%</span>
                                    <span>개당 <fmt:formatNumber value="${item.saving_point}" pattern="###,###,###"/>원 적립</span>
                                </p>
                            </c:if>
                        </c:if>
                        <c:if test="${item.pi_discount_rate == 0}">
                            <p class="discount_price">
                                <fmt:formatNumber value="${item.discounted_price}" pattern="###,###,###"/>원
                            </p>
                            <c:if test="${item.pi_point_rate != 0}">
                                <p class="saving_point">
                                    <span>적립 <fmt:formatNumber value="${item.pi_point_rate}" pattern="###.#"/>%</span>
                                    <span>개당 <fmt:formatNumber value="${item.saving_point}" pattern="###,###,###"/>원 적립</span>
                                </p>
                            </c:if>
                        </c:if>
                    <div class="detail_info">
                        <table>
                            <tbody>
                                <tr>
                                    <td>제조사</td>
                                    <td>${item.mfi_name}</td>
                                </tr>
                                <tr>
                                    <td>등록일</td>
                                    <td><fmt:formatDate value="${item.pi_release_date}" pattern="yyyy.MM.dd."/></td>
                                </tr>
                                <tr>
                                    <td>재고</td>
                                    <td>${item.pi_stock}개</td>
                                </tr>
                                <tr>
                                    <td>문의전화</td>
                                    <td>${item.mfi_phone}</td>
                                </tr>
                                <tr>
                                    <td>배송사</td>
                                    <td>${item.di_name} (배송비: <fmt:formatNumber value="${item.di_price}" pattern="###,###,###"/>원)</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="buy_options">
                        <div class="total_price_area">
                            <p class="total_price">총 상품금액 : <span><fmt:formatNumber value="${item.discounted_price}" pattern="###,###,###"/></span>원</p>
                            <c:if test="${item.pi_point_rate != 0}">
                                <p class="total_save"><span>적립</span> <span><fmt:formatNumber value="${item.saving_point}" pattern="###,###,###"/></span>원</p>
                            </c:if>
                        </div>
                        <div class="buy_option_btns">
                            <div class="count">
                                <div class="count_box">1</div>
                                <div class="count_btns">
                                    <button id="count_up"><i class="fas fa-chevron-up"></i></button>
                                    <button id="count_down"><i class="fas fa-chevron-down"></i></button>
                                </div>
                            </div>
                            <button id="shopping_bag">장바구니 추가</button>
                            <button id="buy">즉시구매</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="item_desc_area">
            <div class="item_desc_wrap">
                <c:forEach items="${item_desc}" var="desc">
                    <p>${desc.pdd_content}</p>
                </c:forEach>
                <c:forEach items="${item_desc_img}" var="desc_img">
                    <img src="http://localhost:8756/image/product/${desc_img.pddi_img_url}">
                </c:forEach>
            </div>
        </section>
        <section class="item_review_area">

        </section>
        <section class="item_qna_area">

        </section>
    </main>

    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>