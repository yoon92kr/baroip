<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="assets\js\slick.min.js"></script>
  
  <script type="text/javascript" src="assets\js\slick.js"></script>
  <link rel="stylesheet" type="text/css" href="assets\js\slick.css"/>
  <link rel="stylesheet" type="text/css" href="assets\js\slick-theme.css"/>
<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="${contextPath}/resource/img/common/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="${contextPath}/resource/css/all.min.css">
    
	<!-- bootstrap -->
	<link rel="stylesheet" href="${contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="${contextPath}/resource/css/main.css">

<!-- Title 배치 -->
<title><tiles:insertAttribute name="title" /></title>

</head>

<body>



	<tiles:insertAttribute name="header" />


	<nav>
		<tiles:insertAttribute name="side" />
	</nav>


	<tiles:insertAttribute name="body" />


	<tiles:insertAttribute name="footer" />


	<tiles:insertAttribute name="chat" />

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

</body>
</html>