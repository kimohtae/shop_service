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
    <link rel="stylesheet" href="/assets/css/index.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="/assets/js/index.js"></script>
</head>
<body>
    <main>
        <section class="main_banner_area">
            <div class="content">
                <!-- Slider main container -->
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide"><img src="/assets/images/banner img (1).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (1).png"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (2).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (3).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (4).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (5).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (6).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (7).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (8).jpg"></div>
                        <div class="swiper-slide"><img src="/assets/images/banner img (9).jpg"></div>
                    </div>
                    <!-- If we need pagination -->
                    
            
                    <div class="slider-btns">
                        <div class="slide-prev">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="slide-next">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <c:if test="${recommend_list_by_member != null}">
            <c:if test="${recommend_list_by_member.size() != 0}">
                <section class="s0 item_list">
                    <h1>이 상품 어때요?</h1>
                    <div class="list_contents">
                        <c:forEach items="${recommend_list_by_member}" var="item">
                            <div class="list_item" title="${item.pi_name}">
                                <div class="thumb" style="background-image: url(http://server02.hadoop.com:8756/image/product/${item.thumbnail});"></div> 
                                <a class="prod_name" href="/product/detail?index=${item.pi_seq}" >
                                    <span class="item_brand">[${item.mfi_name}]</span>
                                    <span class="item_name">${item.pi_name}</span>
                                </a>
                                <div class="price_wrap">
                                    <c:if test="${item.pi_discount_rate != 0}">
                                        <div class="discount_rate_area">
                                            <p class="discount_rate">
                                                <fmt:formatNumber value="${item.pi_discount_rate}" pattern="###,###,###.#"/>%
                                            </p>
                                        </div>
                                    </c:if>
                                    <div class="price_area">
                                        <p class="price">
                                            <fmt:formatNumber value="${item.discounted_price}" pattern="###,###,##0"/>원
                                        </p>
                                        <c:if test="${item.pi_discount_rate != 0}">
                                            <p class="origin_price">
                                                <fmt:formatNumber value="${item.pi_price}" pattern="###,###,###"/>원
                                            </p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </c:if>
        </c:if>
        <section class="s1 item_list">
            <h1>추천 제품</h1>
            <div class="list_contents">
                <c:forEach items="${recommend_list}" var="item">
                    <div class="list_item" title="${item.pi_name}">
                        <div class="thumb" style="background-image: url(http://server02.hadoop.com:8756/image/product/${item.thumbnail});"></div> 
                        <a class="prod_name" href="/product/detail?index=${item.pi_seq}" >
                            <span class="item_brand">[${item.mfi_name}]</span>
                            <span class="item_name">${item.pi_name}</span>
                        </a>
                        <div class="price_wrap">
                            <c:if test="${item.pi_discount_rate != 0}">
                                <div class="discount_rate_area">
                                    <p class="discount_rate">
                                        <fmt:formatNumber value="${item.pi_discount_rate}" pattern="###,###,###.#"/>%
                                    </p>
                                </div>
                            </c:if>
                            <div class="price_area">
                                <p class="price">
                                    <fmt:formatNumber value="${item.discounted_price}" pattern="###,###,##0"/>원
                                </p>
                                <c:if test="${item.pi_discount_rate != 0}">
                                    <p class="origin_price">
                                        <fmt:formatNumber value="${item.pi_price}" pattern="###,###,###"/>원
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <c:forEach items="${prod_map_list}" var="map">
            <section class="item_list">
                <h1>${map.title}</h1>
                <div class="list_contents">
                    <c:forEach items="${map.list}" var="item">
                        <div class="list_item">
                            <div class="thumb" style="background-image: url(http://server02.hadoop.com:8756/image/product/${item.thumbnail});"></div> 
                            <a class="prod_name" href="/product/detail?index=${item.pi_seq}">
                                <span class="item_brand">[${item.mfi_name}]</span>
                                <span class="item_name">${item.pi_name}</span>
                            </a>
                            <div class="price_wrap">
                                <c:if test="${item.pi_discount_rate != 0}">
                                    <div class="discount_rate_area">
                                        <p class="discount_rate">
                                            <fmt:formatNumber value="${item.pi_discount_rate}" pattern="###,###,###.#"/>%
                                        </p>
                                    </div>
                                </c:if>
                                <div class="price_area">
                                    <p class="price">
                                        <fmt:formatNumber value="${item.discounted_price}" pattern="###,###,##0"/>원
                                    </p>
                                    <c:if test="${item.pi_discount_rate != 0}">
                                        <p class="origin_price">
                                            <fmt:formatNumber value="${item.pi_price}" pattern="###,###,###"/>원
                                        </p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </c:forEach>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>