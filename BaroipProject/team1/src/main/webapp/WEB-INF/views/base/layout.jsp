<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tiles:insertAttribute name="favicon" />
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<title> <tiles:insertAttribute name="title" /> </title>
</head>
<body>

<div id="container">
<div id = "header">
<tiles:insertAttribute name="header" />
</div>

<div id = "content">
<tiles:insertAttribute name="body" />
</div>

<footer>
<tiles:insertAttribute name="footer" />
</footer>


</div>
<tiles:insertAttribute name="quickMenu" />
<tiles:insertAttribute name="chat" />
</body>
</html>