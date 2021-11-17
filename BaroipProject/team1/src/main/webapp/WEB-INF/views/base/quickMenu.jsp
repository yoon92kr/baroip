<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="${contextPath}/resources/css/yoon.css" rel="stylesheet"
	type="text/css" media="screen">

<script>
	// 기본 위치(top)값
	var floatPosition = parseInt($(".quickMenu").css('top'));

	alert(floatPosition);

	// scroll 인식
	$(window).scroll(function() {

		// 현재 스크롤 위치
		var currentTop = $(window).scrollTop();
		var bannerTop = currentTop + floatPosition + "px";

		//이동 애니메이션
		$(".quickMenu").stop().animate({
			"top" : bannerTop
		}, 500);

	}).scroll();
</script>

<div id="quickMenu">
	<div>
		<a href="#" id="top_icon"><img
			src="${contextPath}/resources/image/top_icon.png" alt="맨 위로"></a>
	</div>
	<div>최근 본 상품</div>
	<div>
		<div class="test">
			<a href="#"><img class="pastImage"
				src="${contextPath}/resources/image/past_image1.jpg" alt="최근 본 상품 1"></a>
		</div>

		<div>
			<a href="#"><img class="pastImage"
				src="${contextPath}/resources/image/past_image2.jpg" alt="최근 본 상품 2"></a>
		</div>
	</div>

</div>
