<!-- 2021.11.24 윤상현 -->
<!-- 2021.12.03 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


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

<div class="container">
   <div class="row">
      <div class="col-lg-4 text-center">
         <div class="product-image">
            <a
               href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product1.product_id}"><img
               src="data:image/jpeg;base64,${bestProducts.product1.image_file }"
               alt="베스트 상품 이미지"></a>
         </div>
      </div>

      <div class="col-lg-4  text-center">
         <div class="product-image">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product2.product_id}"><img
               src="data:image/jpeg;base64,${bestProducts.product2.image_file }"
               alt="베스트 상품 이미지"></a>
         </div>
      </div>

      <div class="col-lg-4 text-center">
         <div class="product-image">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product3.product_id}"><img
               src="data:image/jpeg;base64,${bestProducts.product3.image_file }"
               alt="베스트 상품 이미지"></a>
         </div>
      </div>
   </div>
   <div class="item-format">
      <div class="row">
         <div class="col-lg-2">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product1.product_id}" class=""> <span
               class="item-title">${bestProducts.product1.product_main_title}
            </span> <br> <span class="item-comment">${bestProducts.product1.product_sub_title}</span>

            </a>
         </div>
         <div class="col-lg-1 main_item_bottom_text ">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product1.product_id}" class=""> <span
               class="item-price"><fmt:formatNumber
                     value="${bestProducts.product1.product_price}" />원</span> <span
               class="item-dc"><fmt:formatNumber
                     value="${bestProducts.product1.product_discount}" />원</span> <br>
               <span class="item-real-price"><fmt:formatNumber
                     value="${bestProducts.product1.product_price-bestProducts.product1.product_discount}" />원</span>
            </a>
         </div>

         <div class="col-lg-1 text-right">
            <form action="${contextPath}/cart/cartLst.do">
               <input type="image"
                  src="${contextPath}/resources/img/common/cart-put-icon.png"
                  alt="카트 담기 버튼 이미지">
            </form>
         </div>


         <div class="col-lg-2">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product2.product_id}" class=""> <span
               class="item-title">${bestProducts.product2.product_main_title}
            </span> <br> <span class="item-comment">${bestProducts.product2.product_sub_title}</span>

            </a>
         </div>
         <div class="col-lg-1 main_item_bottom_text">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product2.product_id}" class=""> <span
               class="item-price"><fmt:formatNumber
                     value="${bestProducts.product2.product_price}" />원</span> <span
               class="item-dc"><fmt:formatNumber
                     value="${bestProducts.product2.product_discount}" />원</span> <br>
               <span class="item-real-price"><fmt:formatNumber
                     value="${bestProducts.product2.product_price-bestProducts.product2.product_discount}" />원</span>
            </a>
         </div>

         <div class="col-lg-1 text-right">
            <form action="${contextPath}/cart/cartLst.do">
               <input type="image"
                  src="${contextPath}/resources/img/common/cart-put-icon.png"
                  alt="카트 담기 버튼 이미지">
            </form>
         </div>

         <div class="col-lg-2">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product3.product_id}" class=""> <span
               class="item-title">${bestProducts.product3.product_main_title}
            </span> <br> <span class="item-comment">${bestProducts.product3.product_sub_title}</span>

            </a>
         </div>
         <div class="col-lg-1 main_item_bottom_text">
            <a href="${contextPath}/product/productDetail.do?product_id=${bestProducts.product3.product_id}" class=""> <span
               class="item-price"><fmt:formatNumber
                     value="${bestProducts.product3.product_price}" />원</span> <span
               class="item-dc"><fmt:formatNumber
                     value="${bestProducts.product3.product_discount}" />원</span> <br>
               <span class="item-real-price"><fmt:formatNumber
                     value="${bestProducts.product3.product_price-bestProducts.product3.product_discount}" />원</span>
            </a>
         </div>

         <div class="col-lg-1 text-right">
            <form action="${contextPath}/cart/cartLst.do">
               <input type="image"
                  src="${contextPath}/resources/img/common/cart-put-icon.png"
                  alt="카트 담기 버튼 이미지">
            </form>
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
         autoplaySpeed : 6000,
         nextArrow : $('.next'),
         prevArrow : $('.prev'),
      });
   });
</script>