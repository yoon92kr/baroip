<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="header">
		<div class="container-fluid">


			<div class="row">
                <div class="col-lg-1 text-right">
					<a href="#" class="logo-text" > 
						<img class="header-icon" src="${contextPath}/resources/img/common/favicon.png">   바로입
					</a>
				</div>
				
				<div class="col-lg-3 text-center">
					<div class="category">
						<a href="#" class="header-navi">농산물</a>
						<a href="#" class="header-navi">수산물</a>
						<a href="#" class="header-navi">축산물</a>
					</div>
				</div>

				<div class="col-lg-2 text-right offset-lg-2">
					<div class="menu_navi">
						<a href="#" class="header-navi">공지사항</a>
						<a href="#" class="header-navi">고객센터</a>
					</div>
				</div>

				<div class="col-lg-2 text-center">
					<div class="menu_navi">
						<a href="#" class="header-navi">로그인</a>
						<a href="#" class="header-navi">회원가입</a>
					</div>	
				</div>

				<div class="col-lg-1 text-center">
					<form>
						<input class="search-box" type="text">
					</form>
				</div>

				<div class="col-lg-1 text-left" >
					<div class="menu_navi">
						<a href="#" class="header-navi"><img src="${contextPath}/resources/img/common/cart-icon.png"></a>
						<a href="#" class="header-navi"><img src="${contextPath}/resources/img/common/site-map-icon.png"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
