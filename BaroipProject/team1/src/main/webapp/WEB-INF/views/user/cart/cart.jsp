<!-- 2021.11.24 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="container-fluid">

	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center"><input type="button" class="cart_agree_bt" onclick='selectAll(this)' value="전체 선택"></div>
		<div class="col-lg-4 offset-lg-2 text-center"><h1 class="page_title">장바구니</h1></div>
	</div>

<div class="cart_list_header">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_title">선택</div>
		<div class="col-lg-5 text-center cart_title">상품정보</div>
		<div class="col-lg-1 text-center cart_title">수량</div>
		<div class="col-lg-1 text-center cart_title">가격</div>
		<div class="col-lg-1 text-center cart_total cart_total_1">총 상품금액</div>
		<div class="col-lg-1 text-center cart_total"><총상품금액></div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox"></div>
		<div class="col-lg-2 text-center cart_body"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></div>
		<div class="col-lg-3 text-center cart_body"><상품이름></div>
		<div class="col-lg-1 text-center cart_body">수량</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1">총 배송비</div>
		<div class="col-lg-1 text-right cart_total_body"><배송비></div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox"></div>
		<div class="col-lg-2 text-center cart_body"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></div>
		<div class="col-lg-3 text-center cart_body"><상품이름></div>
		<div class="col-lg-1 text-center cart_body">수량</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1">총 배송비</div>
		<div class="col-lg-1 text-right cart_total_body"><배송비></div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox"></div>
		<div class="col-lg-2 text-center cart_body"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></div>
		<div class="col-lg-3 text-center cart_body"><상품이름></div>
		<div class="col-lg-1 text-center cart_body">수량</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>
	
	</div>
</div>

</div>

  <script>
  function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByClassName('cart_checkbox');
	  
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
  </script>
