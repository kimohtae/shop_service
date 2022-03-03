<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/index.css"/>
    <script src="/assets/js/index.js"></script>
</head>
<body>
    <main>
        <section class="s1 item_list">
            <c:if test="${page_type == 'category'}">
                <h1>${cate_name}</h1>
            </c:if>

            <c:if test="${page_type == 'search'}">
                <h1>
                    <c:if test="${type == 'name'}">제품명</c:if>
                    <c:if test="${type == 'seller'}">판매자</c:if>
                    <c:if test="${type == 'manufacturer'}">제조사</c:if>
                    "${keyword}" 검색 결과
                </h1>
            </c:if>

            <div class="list_contents">
                <c:if test="${list.size() == 0}">
                    <div class="empty">
                        <h1>등록된 상품이 없습니다.</h1>
                    </div>
                </c:if>

                <c:forEach items="${list}" var="item">
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
            <c:if test="${page_type == 'category'}">
                <div class="pager_area">
                    <c:forEach begin="1" end="${page}" var="i">
                        <a href="/product/list?category=${category}&offset=${(i-1)*12}" class="pager">${i}</a>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${page_type == 'search'}">
                <div class="pager_area">
                    <c:forEach begin="1" end="${page}" var="i">
                        <a href="/product/search?keyword=${keyword}&type=${type}&offset=${(i-1)*12}" class="pager">${i}</a>
                    </c:forEach>
                </div>
            </c:if>

        </section>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>
</html>