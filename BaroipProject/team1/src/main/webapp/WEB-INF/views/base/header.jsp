<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<link href="${contextPath}/resources/css/han.css" rel="stylesheet" type="text/css" media="screen">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

	<div class="header">

		<a href="#" class="header__icon" id="header__icon"><img
			src="${contextPath}/resources/image/baroip_main_logo.png"
			alt="바로입 아이콘"></a> <a href="#" class="header__logo">바로입</a>

		<span class="menu">
			<a href="#">농산물</a> <a href="#">수산물</a> <a href="#">축산물</a>
		</span>

	</div>

