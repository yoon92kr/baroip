<!-- 2021.11.25 윤상현 -->
<!-- 2021.12.28 한건희(자바관련) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- <c:set var="myCartProductInfo" value="${myCartList.cartList.product.productVO}" />
<c:set var="myCartImageInfo" value="${myCartList.cartList.image}" /> --%>


<div class="container-fluid">

	<c:choose>
		<c:when test="${not empty userInfo.user_id}">
			<div class="row">
				<div class="col-lg-4 offset-lg-4 text-center">
					<h1 class="page_title">장바구니</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${empty userInfo.user_id}">
			<div class="row">
				<div class="col-lg-4 offset-lg-4 text-center">
					<h1 class="page_title">장바구니</h1>
					<span class="cart_notUser">현재 비회원 상태입니다. 비회원 주문 시 적립 및 회원 등급 혜택을 받으실 수 없습니다.</span>
				</div>
			</div>
		</c:when>
	</c:choose>

	<div class="cart_list_header">
		<div class="row">

			<div class="col-lg-1 offset-lg-2 text-center cart_title">
				<input type="checkbox" id="cart_checkAll" onclick="checkAll();"
					class="join_01-check-01">
			</div>
			<div class="col-lg-5 text-center cart_title">상품정보</div>
			<div class="col-lg-1 text-center cart_title">수량</div>
			<div class="col-lg-1 text-center cart_title">가격</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty userCartListInfo}">
			<div class="row">
				<div class="offset-lg-2 col-lg-8 text-center cs_01_listsection">
					<span>장바구니에 상품이 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${not empty userCartListInfo}">
			<c:forEach var="i" begin="1" end="${userCartListInfo.size()}" varStatus="price">
			<c:set var="cart" value="myCartList${i}" />

				<form id="ListCeckBoxForm${i}" action="${contextPath}/cart/cartListDelete.do">
					<div class="cart_list_body">
						<div class="row">
							<div class="col-lg-1 offset-lg-2 text-center cart_body cart_checkbox">
								<input id="ListCeckBox${i}" value="${userCartListInfo[cart].product.productVO.product_id}" type="checkbox" class="join_01-check-01" name="checkRow">
							</div>
							<div class="col-lg-2 text-center cart_body">
								<a href="${contextPath}/product/productDetail.do?product_id=${userCartListInfo[cart].product.productVO.product_id}">
									<img class="cart_image_clip" src="data:image/jpeg;base64,${userCartListInfo[cart].image.main}" alt="장바구니 상품 이미지">
								</a>
							</div>
							<div class="col-lg-3 text-center cart_body">
								<input id="cartListProductTitle${i}" type="hidden"  value="${userCartListInfo[cart].product.productVO.product_main_title}" />
								<a id="cartListProductTitle" href="${contextPath}/product/productDetail.do?product_id=${userCartListInfo[cart].product.productVO.product_id}">
									${userCartListInfo[cart].product.productVO.product_main_title}
								</a>
							</div>
							<div class="col-lg-1 text-center itemCount_row">
								<div id="cart_itemCountBox_form">
									<div class="value-button cart_decrease" id="cart_decrease${i}"
										onclick="decreaseValue(this.id)">-</div>
									<input type="number" class="cart_item_count"
										id="cart_item_count${i}" name="cart_count" value="${userCartListInfo[cart].cart.cartVO.cart_count}"
										onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
									<div class="value-button cart_increase" id="cart_increase${i}"
										onclick="increaseValue(this.id)">+</div>
								</div>
							</div>
							<div class="col-lg-1 text-center cart_body">
								<fmt:formatNumber value="${userCartListInfo[cart].product.productVO.product_price * userCartListInfo[cart].cart.cartVO.cart_count}" />
							</div>
						</div>
					</div>
				</form>
			</c:forEach>
		</c:when>
	</c:choose>

	<div class="cart_list_bt">
		<div class="row">
			<div class="col-lg-2 offset-lg-8 text-right cart_check_delete_btn">
				<form id="ListCeckBoxForm" action="${contextPath}/cart/cartListDelete.do">
					<input type="button" value="전체 삭제">
					<input id="selectPriceDelete" type="button" value="선택 삭제">
				</form>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-2 offset-lg-2 text-center cart_total cart_total_1">총 상품금액</div>
		<div class="col-lg-2 text-center cart_total">총 배송비</div>
		<div class="col-lg-2 text-center cart_total">총 할인액</div>
		<div class="col-lg-2 text-center cart_total">
			<span class="maybe_cost_text">예상 결제 금액</span>
		</div>
	</div>
		
	<div class="row">
		<div class="col-lg-2 offset-lg-2 text-center cart_total_price">
			<fmt:formatNumber value="${totalPrice}" />원
		</div>
		<c:if test="${1 > 0}">
			<div class="col-lg-2 text-center cart_total_price">0원</div>
		</c:if>
		<c:if test="${1 < 0}">
			<div class="col-lg-2 text-center cart_total_price">3,000원</div>
		</c:if>
		<div class="col-lg-2 text-center cart_total_price">
			<fmt:formatNumber value="" />원
		</div>
		<div class="col-lg-2 text-center cart_total_price">
			<span class="maybe_cost">
				<fmt:formatNumber value="" />원
			</span>
		</div>
	</div>
			
	<div class="row">
		<div class="col-lg-8 offset-lg-2 cart_list_bottom_hr"></div>
	</div>

	<div class="cart_list_order_bt">
		<div class="row">
			<div class="col-lg-3 offset-lg-2">
				<a href="${contextPath}/order_01.do">
					<img src="${contextPath}/resources/img/common/all_item_order.png"
					alt="장바구니 전체 주문 버튼 이미지">
				</a>
			</div>
			<div class="col-lg-3">
				<a href="${contextPath}/order_01.do">
					<img src="${contextPath}/resources/img/common/select_item_order.png"
					alt="장바구니 선택 주문 버튼 이미지">
				</a>
			</div>
			<div class="col-lg-2">
				<a href="${contextPath}/main.do">
					<img src="${contextPath}/resources/img/common/continue_shopping.png"
					alt="장바구니 쇼핑 계속하기 버튼 이미지">
				</a>
			</div>
		</div>
	</div>
	
</div>


<script>
	/* 체크박스 전체선택, 전체해제 */
	function checkAll() {
		if ($("#cart_checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}

	/*---------- 수량 증감 input 박스 설정 ----------*/

	/* 수량 증가 */
	function increaseValue(tagId) {
		let targetValue = '';
		for (i = 0; i < 10; i++) {
			if (String('cart_increase').concat(i) == String(tagId)) {
				targetValue = 'cart_item_count'.concat(i);
			}

		}
		let countValue = parseInt(document.getElementById(targetValue).value,
				10);

		countValue = isNaN(countValue) ? 0 : countValue;
		countValue++;
		document.getElementById(targetValue).value = countValue;
	};
	
	/* 수량 감소 */
	function decreaseValue(tagId) {
		let targetValue = '';
		for (i = 0; i < 10; i++) {
			if (String('cart_decrease').concat(i) == String(tagId)) {
				targetValue = 'cart_item_count'.concat(i);
			}

		}
		let countValue = parseInt(document.getElementById(targetValue).value,
				10);
		if (countValue <= 1) {
			alert("수량은 1보다 작을 수 없습니다.")
		}
		;
		countValue = isNaN(countValue) ? 0 : countValue;
		countValue < 2 ? countValue = 2 : '';
		countValue--;
		document.getElementById(targetValue).value = countValue;
	};
	
	/* 수량입력 후 엔터 입력시 이벤트 */
	function searchEvt(targetValue, targetId) {

		if (targetValue == "" || targetValue < 1) {
			alert('수량은 1보다 작을 수 없습니다.');
			document.getElementById(targetId).value = 1;
		}

	}

	/* 수량입력 후 다른 영역 클릭 시 이벤트 */
	window.onload = eventPlus();

	function eventPlus() {

		let target = document.querySelectorAll('.cart_item_count');

		for (i = 0; i < target.length; i++) {
			let item = target.item(i);
			item.onblur = eventGo;
		}

	}
	
	function eventGo() {
		if (this.value == "" || this.value < 1) {
			alert('수량은 1보다 작을 수 없습니다.');
			document.getElementById(this.id).value = 1;
		}

	}
	
	/* 장바구니 상품 삭제 */
	$("#selectPriceDelete").on("click", function(e) {
		let userFind = "${userInfo.user_id}";
		let poroduct_id;
		let deleteProduct;
		let deleteItem;
		for(let i=1; i<=${userCartListInfo.size()}; i++) {
			product_id = document.getElementById("ListCeckBox"+i).value;
			deleteItem = document.getElementById("cartListProductTitle"+i).value;
		}
		deleteProduct = confirm(deleteItem + "을(를) 장바구니에서 제거 하시겠습니까?");
		if(deleteProduct == true) {
			$.ajax({
				type:"post", 
				url:"${contextPath}/cart/cartListDelete.do", 
				dataType:"text", 
				data: {
					"product_id" : product_id
				}, 
				success:function(test) {
					alert(test + "상품이 장바구니에서 삭제되었습니다.");
					location.reload();
				}, 
				error:function() {
					alert("해당 상품 삭제가 실패했습니다.");
				}
			});	
		}
	});
	
</script>
