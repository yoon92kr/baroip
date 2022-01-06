<!-- 2022.01.06 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty pageNo }'>
	<script>
		window
				.addEventListener(
						'load',
						function() {
							document.getElementById("${pageNo}").style.fontFamily = "kopub_bold";
							document.getElementById("${pageNo}").style.fontSize = "15px";
						});
	</script>
</c:if>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-center product_01_banner">
			<img id="product_01_main_img"
				src="${contextPath}/resources/img/common/farm_main_banner.jpg"
				alt="상품리스트 배너 이미지">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-8 offset-lg-2 text-center product_01_main_title">농산물</div>
	</div>

	<div class="row">
		<div class="col-lg-6 offset-lg-3 text-center product_01_sub_title">
			<a href="#">채소</a> <a href="#">곡물</a> <a href="#">과일</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 .product_01_hr"></div>
	</div>

</div>


<!-- 아이템 필드  -->
<div class="container">
	<div class="row">
		<div class="col-lg-4 text-left">총 [상품개수] 의 상품이 있습니다.</div>
	</div>

	<div class="row">
		<div class="col-lg-6 text-left product_01_filter">
			<a href="#">판매 인기순</a> <a href="#">등록일순</a> <a href="#">높은 가격순</a> <a
				href="#">낮은 가격순</a>
		</div>

		<div class="col-lg-2 offset-lg-4 text-center">
			<form class="product_01_search-box">
				<input class="search-box" type="text">
			</form>
		</div>

	</div>

	<div class="row">
		<div class="col-lg-12 product_01_hr"></div>

	</div>

	<div class="row">
	
		<div class="col-lg-4">
		
			<div class="product_01_image">	
				<a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product1.product_id}">
					<img src="data:image/jpeg;base64,${productFullList.product1.image_file}" alt="상품 이미지">
				</a>		
			</div>
			
			<div class="row item-format">
			
				<div class="col-lg-6">
					<a href="${contextPath}/product/productDetail.do?product_id=${productFullList.product1.product_id}" class=""> 
					<span class="item-title">${productFullList.product1.product_main_title}</span>		<br>
					<span class="item-comment">${productFullList.product1.product_sub_title}</span>
					</a> 
				</div>
				
				<div class="col-lg-3 main_item_bottom_text">
					<span class="item-price"><fmt:formatNumber value="${productFullList.product1.product_price}" />원</span> 
					<span class="item-dc"><fmt:formatNumber value="${productFullList.product1.product_discount}" />원</span> <br>
					<span class="item-real-price"><fmt:formatNumber value="${productFullList.product1.product_price-productFullList.product1.product_discount}" />원</span>
				</div>
				
				<div class="col-lg-3 text-right">
					<input type="image" src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
				</div>
				
			</div>
			
		</div>
		
		
		
	</div>







</div>