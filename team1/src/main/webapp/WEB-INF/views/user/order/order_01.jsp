<!-- 2021.11.29 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${productList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${productList}" />

<div class="container-fluid">

	<div class="row">

		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">주문 / 결제 페이지</h1>
		</div>
		<div class="col-lg-2 offset-lg-1 text-right">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">01. 주문 / 결제</span> > 02. 완료
			</h6>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
			<h4 class="order_01-content-hedaer-text">주문 리스트</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 offset-lg-1 text-center order_01-content-body">
			상품 정보</div>
		<div class="col-lg-1 text-center order_01-content-body">수량</div>
		<div class="col-lg-2 text-center order_01-content-body">판매 가격</div>
		<div class="col-lg-2  text-center order_01-content-body">할인 금액</div>
		<div class="col-lg-2 text-center order_01-content-body">결제 금액</div>
	</div>

	<c:set var="total_price" value="0" />

	<c:forEach var="i" begin="1" end="${itemSize}">
		<c:set var="key" value="product${i}" />


		<div class="row">
			<div class="col-lg-3 offset-lg-1 order_01-content-item-img">
				<img class="cart_image_clip" src="data:image/jpeg;base64,${itemList[key].image.main}" alt="상품 이미지"> 
				<span class="order_img_to_title">${itemList[key].product.productVO.product_main_title}</span>
			</div>
			<div class="col-lg-1 text-center order_01-content-item">
				<fmt:formatNumber value="${itemList[key].count.order_amount}" /> 개
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<fmt:formatNumber value="${itemList[key].product.productVO.product_price * itemList[key].count.order_amount}" /> 원
			</div>
			<div class="col-lg-2  text-center order_01-content-item">
				<span class="order_red_font"> 
				<fmt:formatNumber value="${itemList[key].product.productVO.product_discount * itemList[key].count.order_amount}" /> 원
				</span>
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<fmt:formatNumber value="${(itemList[key].product.productVO.product_price - itemList[key].product.productVO.product_discount) * itemList[key].count.order_amount}" /> 원
			</div>
			<c:set var="total_price" value="${total_price + (itemList[key].product.productVO.product_price - itemList[key].product.productVO.product_discount) * itemList[key].count.order_amount }" />
		</div>

	</c:forEach>
	<c:if test="${total_price < 30000 }">
		<c:set var="total_price" value="${total_price + 5000 }" />
	</c:if>
	<div class="row">
		<div class="col-lg-3 offset-lg-8 text-right">
			<div class="order_01-content-item-price order_total_price_margin">
				<span>최종 주문 금액 : </span> <span class="order_01-content-price"><fmt:formatNumber value="${total_price}" />원</span>
				<c:if test="${total_price >= 30000 }">
					<span class="order_01-content-price order_red_font_small">(배송비 무료)</span>
				</c:if>
				<c:if test="${total_price < 30000 }">
					<span class="order_01-content-price order_red_font_small">(배송비 5,000원 포함)</span>
				</c:if>

			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
			<h4 class="order_01-content-hedaer-text">주문자 정보</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 offset-lg-1 text-center order_01-content-body">
			아이디</div>
		<div class="col-lg-4 text-center order_01-content-body">이름</div>
		<div class="col-lg-3 text-center order_01-content-body">연락처</div>
	</div>

	<c:if test="${not empty userInfo}">
		<div class="row">
			<div class="col-lg-3 offset-lg-1 text-center order_01-content-item">${userInfo.user_id}</div>
			<div class="col-lg-4 text-center order_01-content-item">${userInfo.user_name}</div>
			<div class="col-lg-3 text-center order_01-content-item">${userInfo.user_mobile_1} - ${userInfo.user_mobile_2} - ${userInfo.user_mobile_3}</div>
		</div>
	</c:if>
	<c:if test="${empty userInfo}">
		<div class="row">
			<div class=" col-lg-10 offset-lg-1 text-center order_01-content-item">비회원 상태 입니다.</div>
		</div>
	</c:if>


	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-03">
			<h4 class="order_01-content-hedaer-text">배송 정보</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-body-top-line">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			이 름</div>
		<div class="col-lg-9 join_02-main-right">
			<input class="join_02-text-box" type="text"> <span
				class="order_01-check-text">주문자 정보와 동일</span> <input
				class="order_01-check" type="checkbox" name="join_check_01"
				value="true">


		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			주 소</div>
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box" type="text"> <input
				class="join_02-submit-box" type="submit" value="우편번호 검색">

		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			상세 주소</div>
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box" type="text">

		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			핸드폰 번호</div>
		<div class="col-lg-9 join_02-main-right">

			<select class="join_02-mobile">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
				<option value="070">070</option>
			</select> - <input class="join_02-mobile-02" type="number"
				oninput="join_02_mobile_number01(this, 4)"> - <input
				class="join_02-mobile-02" type="number"
				oninput="join_02_mobile_number01(this, 4)">

		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 offset-lg-1 text-center join_02-main-left">
			주문 메세지</div>
		<div class="col-lg-9 join_02-main-right">

			<input class="join_02-text-box" type="text">

		</div>
	</div>

	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
			<h4 class="order_01-content-hedaer-text">결제 상세</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
			최종 주문 금액</div>
		<div class="col-lg-3 text-center order_01-content-body">보유 포인트</div>
		<div class="col-lg-3 text-center order_01-content-body">사용 포인트</div>
		<div class="col-lg-2  text-center order_01-content-body">결제 금액</div>
	</div>

	<div class="row">
		<div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
			<span class="order_01-content-price"><fmt:formatNumber value="${total_price}" />원</span>
		</div>
		<c:if test="${empty userInfo}">
			<div class=" col-lg-3 text-center order_01-content-item">-</div>
			<div class=" col-lg-3 text-center order_01-content-item">-</div>			
			<div class="col-lg-2 text-center order_01-content-item">
				<span class="order_01-content-price"><fmt:formatNumber value="${total_price}" />원</span>
			</div>				
		</c:if>		

		<c:if test="${not empty userInfo}">
			<div class="col-lg-3 text-center order_01-content-item"><fmt:formatNumber value="${userInfo.user_point}" />원</div>
			<div class="col-lg-3 text-center order_01-content-item-point">
	
				<input class="order_01-point-box" type="text"> <input
					class="order_01-point-box" type="submit" value="전체 포인트 사용">
	
			</div>
			<div class="col-lg-2 text-center order_01-content-item">
				<span class="order_01-content-price"><fmt:formatNumber value="${total_price}" />원</span>
			</div>
		</c:if>			


	</div>

	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
			<h4 class="order_01-content-hedaer-text">결제 방법</h4>
		</div>
	</div>

	<div class="order_01-select-card-noBank-mobile">
		<div class="row">
			<div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
				결제 수단</div>
			<div class="col-lg-8 text-center order_01-content-body">

				<input id="order_01-selectPay-card" type="radio" name="payment"
					value="card" onClick="selectPay(this.id)" checked> <label
					for="order_01-selectPay-card">신용 / 체크 카드</label> <input
					id="order_01-selectPay-noBank" class="order_01-radio-btn"
					type="radio" name="payment" value="noBank"
					onClick="selectPay(this.id)"> <label
					for="order_01-selectPay-noBank">무통장 입금</label> <input
					id="order_01-selectPay-mobile" class="order_01-radio-btn"
					type="radio" name="payment" value="mobile"
					onClick="selectPay(this.id)"> <label
					for="order_01-selectPay-mobile">휴대폰 결제</label>

			</div>
		</div>

		<!-- 결제 방식에 따른 결제 방법 상세 -->
		<div class="row">
			<div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
				세부 내용</div>
			<div class="col-lg-8 text-center order_01-content-item">
				<div id="order_01-selectPay-card-text">

					<span class="order_01-select-card">카드 선택</span> <select
						class="order_01-select-choice-card order_01-select-card">
						<option value="선택해주세요">선택해주세요</option>
						<option value="신한카드">신한카드</option>
						<option value="하나카드">하나카드</option>
						<option value="삼성카드">삼성카드</option>
						<option value="농협카드">농협카드</option>
						<option value="국민카드">국민카드</option>
						<option value="현대카드">현대카드</option>
					</select> <span
						class="order_01-select-choice-card-text order_01-select-card">할부
						개월 수</span> <select
						class="order_01-select-choice-card order_01-select-card">
						<option value="일시불">일시불</option>
						<option value="2개월">2개월</option>
						<option value="3개월">3개월</option>
						<option value="4개월">4개월</option>
						<option value="5개월">5개월</option>
						<option value="6개월">6개월</option>
					</select>

				</div>

				<div id="order_01-selectPay-noBank-text">

					무통장 입금자 명 <input class="order_01-noBank-text-box" type="text">

				</div>

				<div id="order_01-selectPay-mobile-text">

					휴대폰 결제 <select class="join_02-mobile">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
						<option value="070">070</option>
					</select> - <input class="join_02-mobile-02" type="number"
						oninput="join_02_mobile_number01(this, 4)"> - <input
						class="join_02-mobile-02" type="number"
						oninput="join_02_mobile_number01(this, 4)">

				</div>

			</div>
		</div>
	</div>

	<!-- 하단 버튼 -->
	<div class="row">
		<div class="col-lg-4 offset-lg-2 text-center order_01-bottom-btn">

			<a class="join_01-back" href="${contextPath}/cart/cartList.do"> <input
				class="cart_btn_gray" type="button" id="cs_02_02_list_btn"
				value="돌아가기">
			</a>

		</div>
		<div class="col-lg-4 text-center order_01-bottom-btn">

			<a class="order_01-select-btn" href="order_02.do"> <input
				class="cart_btn_Bgreen" type="button" id="cs_02_02_list_btn"
				value="결제하기">
			</a>

		</div>
	</div>

</div>

<script type="text/javascript">
	function selectPay(selectId) {
		let card = '#order_01-selectPay-card-text';
		let noBank = '#order_01-selectPay-noBank-text';
		let mobile = '#order_01-selectPay-mobile-text';

		let targetPay = '#'.concat(selectId, '-text');

		if (targetPay == card) {
			document.querySelector(card).style.display = 'inline';
			document.querySelector(noBank).style.display = 'none';
			document.querySelector(mobile).style.display = 'none';
		}

		else if (targetPay == noBank) {
			document.querySelector(card).style.display = 'none';
			document.querySelector(noBank).style.display = 'inline';
			document.querySelector(mobile).style.display = 'none';
		}

		else if (targetPay == mobile) {
			document.querySelector(card).style.display = 'none';
			document.querySelector(noBank).style.display = 'none';
			document.querySelector(mobile).style.display = 'inline';
		}

	}

	function join_02_mobile_number01(el, maxlength) {
		if (el.value.length > maxlength) {
			el.value = el.value.substr(0, maxlength);
		}
	}
</script>