<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<div class="quick-menu">
		<div class="quick-item up"><a href="#"><img src="${contextPath }/resources/img/common/top.png"></a></div>
		<p>최근 본 상품</p>
		
		<div class="quick-item past-image"><a href="#"><img src="${contextPath }/resources/img/common/img-box.jpg"></a></div>
		<div class="quick-item past-image"><a href="#"><img src="${contextPath }/resources/img/common/img-box.jpg"></a></div>
	</div>
	
	<script>
	  $(function(){
			$('.up').on('click',function(e){
			e.preventDefault();
			$('html,body').animate({scrollTop:0},300);
			});
		});
  </script>