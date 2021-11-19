<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="${contextPath}/resources/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="${contextPath}/resources/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="${contextPath}/resources/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="${contextPath}/resources/css/responsive.css">
	
	<!--  Favicon 배치 -->
	<tiles:insertAttribute name="favicon" />
	<!-- Title 배치 -->
	<title> <tiles:insertAttribute name="title" /> </title>
	
</head>

<body>



<tiles:insertAttribute name="header" />


<nav>
<tiles:insertAttribute name="side" />
</nav>


<tiles:insertAttribute name="body" />


<tiles:insertAttribute name="footer" />


<tiles:insertAttribute name="chat" />

	
	<!-- jquery -->
	<script src="${contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="${contextPath}/resources/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="${contextPath}/resources/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="${contextPath}/resources/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="${contextPath}/resources/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="${contextPath}/resources/js/sticker.js"></script>
	<!-- main js -->
	<script src="${contextPath}/resources/js/main.js"></script>


</body>
</html>