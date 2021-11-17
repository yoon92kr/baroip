<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="quickMenu">

	<div class="quickMenu_item">
		<a href="#"><img id="top_icon"
			src="${contextPath}/resources/image/top_icon.png" alt="맨 위로"></a>
	</div>

	<div class="quickMenu_item">최근 본 상품</div>


	<div class="quickMenu_item">
		<a href="#"><img class="pastImage"
			src="${contextPath}/resources/image/past_image1.jpg" alt="최근 본 상품 1"></a>
	</div>

	<div class="quickMenu_item">
		<a href="#"><img class="pastImage"
			src="${contextPath}/resources/image/past_image2.jpg" alt="최근 본 상품 2"></a>
	</div>
	
	<div class="quickMenu_item"></div>


</div>
