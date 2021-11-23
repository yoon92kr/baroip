<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


	<div class="main-section" >
		<div class="container-fluid">
		<!--page slider -->
		<div class="post-slider">
  
		  <div class="post-wrapper">
			<div class="post">
			  <img src="${contextPath}/resources/img/common/img-box.jpg" class="slider-image">
	
			</div>
			<div class="post">
			  <img src="${contextPath}/resources/img/common/img-box.jpg" class="slider-image">
			</div>
	
			<div class="post">
			  <img src="${contextPath}/resources/img/common/img-box.jpg" class="slider-image">
			</div>
			
			<div class="post">
			  <img src="${contextPath}/resources/img/common/img-box.jpg" class="slider-image">
	
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
                <div class="col-lg-4 offset-lg-1"><hr></div>

				<div class="col-lg-2 text-center">
					<div class="section-title">	
						<p>BEST ITEM<p>
					</div>
				</div>

                <div class="col-lg-4"><hr></div>
			</div>
            <br>
			
		</div>

        <div class="container">        
			<div class="row">
				<div class="col-lg-4 text-center">
					<div class="product-image">
						<a href="#"><img src="${contextPath}/resources/img/common/img-box.jpg" alt=""></a>		
					</div>
				</div>

				<div class="col-lg-4  text-center">
					<div class="product-image">
						<a href="#"><img src="${contextPath}/resources/img/common/img-box.jpg" alt=""></a>
					</div>
				</div>

				<div class="col-lg-4 text-center">
					<div class="product-image">
						<a href="#"><img src="${contextPath}/resources/img/common/img-box.jpg" alt=""></a>
					</div>
				</div>
			</div>
			<div class="item-format">
			<div class="row">
				<div class="col-lg-2">
					<a href="#" class="item-title"><상품명></a><br>
					<a href="#" class="item-comment"><상품설명></a>
					
				</div>
	
				<div class="col-lg-1 text-left">
					<a href="#" class="item-price"><상품원가></a>
					<a href="#" class="item-dc"><할인율></a><br>
					<a href="#" class="item-real-price"><판매가></a>
				</div>


				<div class="col-lg-1 text-center">
					<a href="#"><img class="cart-put-icon" src="${contextPath}/resources/img/common/cart-put-icon.png"></a>
				</div>

				<div class="col-lg-2">
					<a href="#" class="item-title"><상품명></a><br>
					<a href="#" class="item-comment"><상품설명></a>
					
				</div>
				
				<div class="col-lg-1 text-right">
					<a href="#" class="item-price"><상품원가></a><br>
					<a href="#" class="item-real-price"><판매가></a>
				</div>

				<div class="col-lg-1 text-center">
					<a href="#"><img class="cart-put-icon" src="${contextPath}/resources/img/common/cart-put-icon.png"></a>
				</div>

				<div class="col-lg-2">
					<a href="#" class="item-title"><상품명></a><br>
					<a href="#" class="item-comment"><상품설명></a>
					
				</div>

				<div class="col-lg-1 text-right">
					<a href="#" class="item-price"><상품원가></a><br>
					<a href="#" class="item-real-price"><판매가></a>
				</div>
				
				<div class="col-lg-1 text-center">
					<a href="#"><img class="cart-put-icon" src="${contextPath}/resources/img/common/cart-put-icon.png"></a>
				</div>
			</div>

			</div>
		</div>
	</div>
	
		<script type="text/javascript">
		$(document).ready(function() {
			$('.post-wrapper').slick({
				slidesToShow : 1,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 3000,
				nextArrow : $('.next'),
				prevArrow : $('.prev'),
			});
		});
	</script>