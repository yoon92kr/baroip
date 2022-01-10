<!-- 2021.11.24 윤상현 -->
<!-- 2021.12.03 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="3" />
<!-- itemList에는 표시할 item의 size를 대입한다. -->
<c:set var="itemList" value="${bestProducts.size()}" />

<div class="main-section">
   <div class="container-fluid">
      <!--page slider -->
      <div class="post-slider">

         <div class="post-wrapper">
            <div class="post">
               <img src="${contextPath}/resources/img/common/mainImage1.jpg"
                  class="slider-image" alt="메인 이미지">

            </div>
            <div class="post">
               <img src="${contextPath}/resources/img/common/mainImage2.jpg"
                  class="slider-image" alt="메인 이미지">
            </div>

            <div class="post">
               <img src="${contextPath}/resources/img/common/mainImage3.jpg"
                  class="slider-image" alt="메인 이미지">
            </div>

            <div class="post">
               <img src="${contextPath}/resources/img/common/mainImage4.jpg"
                  class="slider-image" alt="메인 이미지">

            </div>
         </div>
      </div>
      <!--post slider-->
   </div>
</div>
<br>

<!-- product section -->

<div class="product-section">
   <div class="container-fluid">

      <div class="row">
         <div class="col-lg-4 offset-lg-1 main-section-solid">
            <hr>
         </div>

         <div class="col-lg-2 text-center">
            <div class="section-title">BEST ITEM</div>
         </div>

         <div class="col-lg-4 main-section-solid">
            <hr>
         </div>
      </div>
      <br>
   </div>
</div>
	<c:if test="${empty bestProducts}">
		<br><div class="col-lg-12 text-center"> 등록된 상품이 없습니다.</div>
	</c:if>

	

<div class="container">
   <div class="row">
	<c:if test="${not empty bestProducts}">   
 	  	<c:forEach var="i" begin="1" end="${itemList}">
			<c:set var="key" value="product${i}" />
			
		<div class="col-lg-4">
		

		
			<div class="product_01_image">	
				<a href="${contextPath}/product/productDetail.do?product_id=${bestProducts[key].product_id}">
					<img src="data:image/jpeg;base64,${bestProducts[key].image_file}" alt="상품 이미지">
				</a>		
			</div>
			
			<div class="row item-format">
			
				<div class="col-lg-6">
					<a href="${contextPath}/product/productDetail.do?product_id=${bestProducts[key].product_id}"> 
					<span class="item-title">${bestProducts[key].product_main_title}</span>		<br>
					<span class="item-comment">${bestProducts[key].product_sub_title}</span>
					</a> 
				</div>
				
				<div class="col-lg-3 main_item_bottom_text">
					<span class="item-price"><fmt:formatNumber value="${bestProducts[key].product_price}" />원</span> 
					<span class="item-dc"><fmt:formatNumber value="${bestProducts[key].product_discount}" />원</span> <br>
					<span class="item-real-price"><fmt:formatNumber value="${bestProducts[key].product_price-bestProducts[key].product_discount}" />원</span>
				</div>
				
				<div class="col-lg-3 text-right">
					<a href="${contextPath}/cart/addProductInCart.do?cart_count=1&product_id=${bestProducts[key].product_id}">
						<img src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
					</a>
				</div>
				
			</div>
			
		</div>
		
		
		</c:forEach>
	</c:if>
	</div>
</div>

<script type="text/javascript">
   $(document).ready(function() {
      $('.post-wrapper').slick({
         slidesToShow : 1,
         slidesToScroll : 1,
         autoplay : true,
         autoplaySpeed : 6000,
         nextArrow : $('.next'),
         prevArrow : $('.prev'),
      });
   });
</script>