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
<body>
	<div class="sidebar-left" id="mypage">
	
	<a href="#"  class="no-underline">내정보</a><br>
	<a href="#"  class="no-underline">회원정보 수정</a><br>
	<a href="#"  class="no-underline">주문/배송조회</a><br>
	<a href="#"  class="no-underline">장바구니</a><br>
	<a href="#"  class="no-underline">포인트 내역</a><br>
	<a href="#"  class="no-underline">회원등급 안내</a><br>
	<a href="#"  class="no-underline">문의내역</a><br>
	<a href="#"  class="no-underline">상품후기</a><br>
	</div>
</body>


	