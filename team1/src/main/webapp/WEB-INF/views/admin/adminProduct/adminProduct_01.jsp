<!-- 2021.12.02 한건희 -->
<!-- 2021.12.08 윤상현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty message }'>
	<script>
		alert("${message}");
	</script>
</c:if>
<div class="container">

	<div class="row">
		<div class="col-lg-8 offset-lg-2 text-center">
			<h1 class="page_title">관리자 페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">상품 등록</span>
			</h6>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 text-center adminUser_01-content-header">
			조회 유형 <select class="adminUser_01-select-box-lookup"
				onchange="Productchange(this.value)">
				<option value="productUpDate">상품 등록일</option>
				<option value="productName">상품 명</option>
			</select>
		</div>
		<div class="col-lg-4 text-center adminUser_01-content-header">
			조회 기준 <input id="adminProduct_01-productUpDate-text" type="date">
			<input id="adminProduct_01-productName-text" type="text">
		</div>
		<div class="col-lg-4 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기"> <input
				class="adminProduct_01-header-button adminProduct_01-button-top"
				type="button" value="상품 임시 등록"
				onclick="location.href='${contextPath}/admin/product/addProductForm.do'">
		</div>
	</div>

	<div class="row">
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 등록일</h6>
		</div>
		<div
			class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 이미지</h6>
		</div>
		<div
			class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 명</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 재고</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상태 변경</h6>
		</div>
	</div>
	<c:if test="${empty extraList}">
		<br>
		<div class="col-lg-12 text-center">임시 등록된 상품이 없습니다.</div>
	</c:if>
	<c:if test="${not empty extraList}">
		<c:forEach var="i" begin="1" end="${extraList.size()}">
			<c:set var="key" value="product${i}" />

			<div class="row">
				<div class="col-lg-2 text-center order_01-content-item">${extraList[key].product_cre_date}</div>
				<div class="col-lg-3 text-center order_01-content-item-img">
					<a
						href="${contextPath}/product/productDetail.do?product_id=${extraList[key].product_id}">
						<img class="cart_image_clip"
						src="data:image/jpeg;base64,${extraList[key].image_file}"
						alt="상품 관리 페이지 상품 이미지">
					</a>
				</div>
				<div id="admin_product_title${i}" class="col-lg-3 text-center order_01-content-item">${extraList[key].product_main_title}
				</div>
				<div class="col-lg-2 order_01-content-item">
					<form name="itemCountBox" id="adminProduct_01-itemCountBox-detail">
						<div class="adminProduct_01-value-button adminProduct_01-decrease"
							id="amount_decrease${i}" onclick="decreaseValue(this.id)">-</div>
						<input type="number" class="adminProduct_product_amount_count"
							id="product_item_count${i}" value="${extraList[key].product_amount}"
							onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
						<div class="adminProduct_01-value-button adminProduct_01-increase"
							id="amount_increase${i}" onclick="increaseValue(this.id)">+</div>
						<input type="hidden" id="product_${i}"
							value="${extraList[key].product_id}">
						<!-- 					<input class="admin_01-itemCountBox-btn" type="submit" value="변경"> -->
					</form>
					<input class="admin_01-itemCountBox-btn" id="${i}" type="button"
						value="변경" onclick="update_amount(this.id)">
				</div>
				<div class="col-lg-2 text-center adminProduct_01-content-item">
					<input class="adminProduct_01-product adminProduct_01-product-top"
						type="button" value="상품 수정"
						onclick="location.href='${contextPath}/adminProduct_03.do'">
					<input class="adminProduct_01-product" id="${i}" type="button" value="상품 삭제" onclick="delete_product(this.id)">
				</div>
			</div>
		</c:forEach>
	</c:if>


</div>

<script type="text/javascript">
	function Productchange(selectValue) {
		let adminProduct_01_Date = '#adminProduct_01-productUpDate-text';
		let adminUser_01_name = '#adminProduct_01-productName-text';

		let adminProduct_01 = '#adminProduct_01-'.concat(selectValue, '-text');

		if (adminProduct_01 == adminProduct_01_Date) {
			document.querySelector(adminProduct_01_Date).style.display = 'inline';
			document.querySelector(adminUser_01_name).style.display = 'none';
		} else if (adminProduct_01 == adminUser_01_name) {
			document.querySelector(adminUser_01_name).style.display = 'inline';
			document.querySelector(adminProduct_01_Date).style.display = 'none';
		}
	}
	/*---------- 수량 증감 input 박스 설정 ----------*/

	/* 수량 증감 */
	function increaseValue(tagId) {
		let targetValue = '';
		for (i = 0; i < 10; i++) {
			if (String('amount_increase').concat(i) == String(tagId)) {
				targetValue = 'product_item_count'.concat(i);
			}

		}
		let countValue = parseInt(document.getElementById(targetValue).value,
				10);

		countValue = isNaN(countValue) ? 0 : countValue;
		countValue++;
		document.getElementById(targetValue).value = countValue;
	};

	function decreaseValue(tagId) {
		let targetValue = '';
		for (i = 0; i < 10; i++) {
			if (String('amount_decrease').concat(i) == String(tagId)) {
				targetValue = 'product_item_count'.concat(i);
			}

		}
		let countValue = parseInt(document.getElementById(targetValue).value,
				10);
		if (countValue <= 0) {
			alert("수량은 0보다 작을 수 없습니다.")
		}
		;
		countValue = isNaN(countValue) ? 0 : countValue;
		countValue < 1 ? countValue = 1 : '';
		countValue--;
		document.getElementById(targetValue).value = countValue;
	};
	/* 수량입력 후 엔터 입력시 이벤트 */

	function searchEvt(targetValue, targetId) {

		if (targetValue == "" || targetValue < 0) {
			alert('수량은 0보다 작을 수 없습니다.');
			document.getElementById(targetId).value = 0;
		}

	}

	/* 수량입력 후 다른 영역 클릭 시 이벤트 */
	/* window.addEventListener('load', eventPlus()); */
	window.onload = eventPlus();

	function eventPlus() {

		let target = document
				.querySelectorAll('.adminProduct_product_amount_count');

		for (i = 0; i < target.length; i++) {
			let item = target.item(i);
			item.onblur = eventGo;
		}

	}
	function eventGo() {
		if (this.value == "" || this.value < 0) {
			alert('수량은 0보다 작을 수 없습니다.');
			document.getElementById(this.id).value = 0;
		}

	}
	/* 상품 수량 수정 ajax */
	function update_amount(target) {
		let target_id = document.getElementById('product_'.concat(target)).value;
		let change_count_value = document.getElementById('product_item_count'
				.concat(target)).value;
		let target_title = document.getElementById('admin_product_title'.concat(target)).innerText;

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/product/update_amount.do",
			dataType : "text",
			data : {
				"product_id" : target_id,
				"product_amount" : change_count_value,
				"product_title" : target_title
			},
			success : function(message) {

				alert(message);

			},
			error : function() {
				alert("재고 수량 변경에 문제가 발생하였습니다.");
			}

		});
	}
	
	/* 상품 삭제 ajax */
	function delete_product(target) {
		
		let product_title = document.getElementById('admin_product_title'.concat(target)).innerText;
		let product_id = document.getElementById('product_'.concat(target)).value;
		var confirmFlag = confirm(product_title+"을 정말 삭제하시겠습니까?")
		if(confirmFlag){
			
			$.ajax({
				type : "post",
				async : false,
				url : "${contextPath}/admin/product/delete_product.do",
				dataType : "text",
				data : {
					"product_id" : product_id			
				},
				success : function(message) {
			/* 		alert(message); */
					location.reload();
				},
				error : function() {
					alert("해당 상품 삭제에 문제가 발생하였습니다.");
				}

			});
		}
			

	
	}
</script>