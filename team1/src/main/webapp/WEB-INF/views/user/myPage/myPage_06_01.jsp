<!--  2021.11.29 강보석 -->
<!-- 2022.02.08 한건희 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">마이페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-8 text-left cs_01_subtitle">
			<h3>문의 내역</h3>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<span>${detail.question.notice_title}</span>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>문의 유형</span>
		</div>
		<c:if test="${empty detail.question.notice_type}">
			<div class="col-lg-4 text-center cs_02_02_box02">
				<span>상품 문의</span>
			</div>
		</c:if>
		<c:if test="${not empty detail.question.notice_type}">
			<div class="col-lg-4 text-center cs_02_02_box02">
				<span>${detail.question.notice_type}</span>
			</div>
		</c:if>
	</div>

	<c:if test="${not empty detail.product_title}">
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>문의 상품명</span>
			</div>
			<div class="col-lg-4 text-center cs_02_02_box02">
				<span>${detail.product_title}</span>
			</div>
		</div>
	</c:if>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<span>${detail.question.notice_body}</span>
		</div>
	</div>
	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>답변</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<span>${detail.answer.notice_body}</span>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center">
			<div class="notice_back_btn">
				<form>
					<input type="image"
						src="${contextPath}/resources/img/common/cs_correct_01.png"
						alt="mypage06 문의 수정하기 버튼 이미지">
				</form>
			</div>
		</div>

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<input class="user_btn_gray" type="button" value="목록" onclick="history.back();">
			</div>
		</div>

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<input class="user_btn_Dgray" type="button" value="삭제하기" onclick="">
			</div>
		</div>

	</div>
</div>



