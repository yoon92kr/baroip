<!-- 2021.11.29 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-left">
			<a href="${contextPath}/product_02.do">상품 상세정보</a> 
			<a href="${contextPath}/product_03.do">고객 후기</a> 
			<a href="${contextPath}/product_04.do">배송 / 교환 /반품 안내</a> 
			<a href="${contextPath}/product_05.do">상품 문의</a>
		</div>
	</div>
	</div>