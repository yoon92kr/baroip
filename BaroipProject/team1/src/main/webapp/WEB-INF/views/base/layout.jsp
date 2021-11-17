<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/lim.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/han.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/yoon.css" rel="stylesheet" type="text/css" media="screen">

<tiles:insertAttribute name="favicon" />
<title> <tiles:insertAttribute name="title" /> </title>
</head>
<body>


<header>
<tiles:insertAttribute name="header" />
</header>


<nav>
<tiles:insertAttribute name="side" />
</nav>

<article>
<tiles:insertAttribute name="body" />
</article>

<footer>
<tiles:insertAttribute name="footer" />
</footer>



<tiles:insertAttribute name="quickMenu" />
<tiles:insertAttribute name="chat" />

</body>
</html>