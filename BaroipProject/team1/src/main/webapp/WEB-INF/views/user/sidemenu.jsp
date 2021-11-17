<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
<style>
   .no-underline{
      text-decoration:none;
   }
 </style>
 
  <meta charset="UTF-8">
  <link href="${contextPath}/resources/css/lim.css" rel="stylesheet" type="text/css" madia="screen">
  <title><tiles:insertAttribute name="sidebar-left" /></title>
</head>
<body>
  <h2>
	<a href="#"  class="no-underline">내정보</a><br>
	<a href="#"  class="no-underline">회원정보 수정</a><br>
	<a href="#"  class="no-underline">주문/배송조회</a><br>
	<a href="#"  class="no-underline">장바구니</a><br>
	<a href="#"  class="no-underline">포인트 내역</a><br>
	<a href="#"  class="no-underline">회원등급 안내</a><br>
	<a href="#"  class="no-underline">문의내역</a><br>
	<a href="#"  class="no-underline">상품후기</a><br>
  </h2> 
   
	<!--  
	<h1>
		<a href="${contextPath}/member/listMembers.do"  class="no-underline">회원관리</a><br>
		<a href="${contextPath}/board/listArticles.do"  class="no-underline">게시판관리</a><br>
		<a href="#"  class="no-underline">상품관리</a><br>
	</h1>
	
	-->
</body>
</html>