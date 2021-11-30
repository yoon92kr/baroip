<!--  2021.11.30 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-left product_02_mini_category_text product_03_mini_category_text">
			<a href="${contextPath}/product_02.do">상품 상세정보</a> 
			<a href="${contextPath}/product_03.do">고객 후기</a> 
			<a href="${contextPath}/product_04.do">배송 / 교환 /반품 안내</a> 
			<a href="${contextPath}/product_05.do">상품 문의</a>
		</div>
	</div>
	

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<div class="product_03_title">상품 문의 작성</div>	
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center product_06_form_title">
			<span>제목</span>
		</div>
		<div class="col-lg-4 text-left product_06_form_box">
			<input class="product_06_text_box" type="text" placeholder=" 제목을 입력해주세요.">
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center product_06_form_title">
			<span>공개여부</span>
		</div>
		<div class="col-lg-4 product_06_form_box">
			<form>
				<input type="radio" name="chk_info" value="public" checked="checked">공개 
				<input type="radio" name="chk_info" value="private"	checked="checked"> 비공개
			</form>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center product_06_form_title">
			<span>문의 상품명</span>
		</div>
		<div class="col-lg-4 text-center product_06_form_box">
			<input type="text" class="product_06_text_box product_06_item_title" value="[상품명]" readonly >
		</div>
	</div>



	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center product_06_form_title">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left product_form_box">
			<input type="text" class="product_06_form_text_box" placeholder=" 내용을 입력해주세요.">
		</div>

	</div>
</div>


<div class="container-fluid">

	<div class="row">
		<div class="offset-lg-4 col-lg-2 text-center">
			<div class="cs_correct_btn">
				<a href="${contextPath}/product_05.do"><img
					src="${contextPath}/resources/img/common/cs_register.png"
					alt="상품문의 등록하기 버튼 이미지"></a>
			</div>
		</div>

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<a href="${contextPath}/product_05.do"><img
					src="${contextPath}/resources/img/common/cs_return.png"
					alt="상품문의 돌아가기 버튼 이미지"></a>
			</div>
		</div>



	</div>
</div>



