<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        let prod_seq = "${product}";
        let order_seq = "${order}";
    </script>
    <script src="/assets/js/member/review.js"></script>
    <link rel="stylesheet" href="/assets/css/member/review.css">
</head>
<body>
    <main>
        <div class="content_wrap">
            <h1>리뷰 작성</h1>
            <div class="prod_review_score">
                <h2>제품 품질 리뷰</h2>
                <p>구매하신 제품에 대한 만족도는 어느 정도 인가요?</p>
                <div class="img_area" style="background-image: url(http://server02.hadoop.com:8756/image/product/${prod.thumbnail});"></div>
                <div class="score_area">
                    <p>${prod.pi_name}</p>
                    <input type="radio" id="score1" name="score" class="score" value="1">
                    <label for="score1">1점</label>
                    <input type="radio" id="score2" name="score" class="score" value="2">
                    <label for="score2">2점</label>
                    <input type="radio" id="score3" name="score" class="score" value="3">
                    <label for="score3">3점</label>
                    <input type="radio" id="score4" name="score" class="score" value="4">
                    <label for="score4">4점</label>
                    <input type="radio" id="score5" name="score" class="score" value="5" checked>
                    <label for="score5">5점</label>
                </div>
            </div>
            <div class="detail_review">
                <h2>상세 리뷰</h2>
                <p>고객님의 다양한 의견을 제시해주세요</p>
                <textarea id="review" placeholder="리뷰를 작성해주세요"></textarea>
            </div>
            <div class="btn_area">
                <button id="cancel">취소하기</button>
                <button id="save">등록하기</button>
            </div>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp"%>
</body>