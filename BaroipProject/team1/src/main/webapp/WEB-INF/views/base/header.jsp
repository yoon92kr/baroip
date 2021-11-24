<!-- 2021.11.24 윤상현 -->

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
					<div class="notice_navi">
						<a href="#" class="header-navi">공지사항</a>
						<a href="#" class="header-navi">고객센터</a>
					</div>
				</div>

				<div class="col-lg-2 text-center">
					<div class="user_navi">
						<a href="#" class="header-navi">로그인</a>
						<a href="#" class="header-navi">회원가입</a>
					</div>	
				</div>

				<div class="col-lg-1 text-center">
					<form>
						<input class="search-box" type="text">
					</form>
				</div>
				
				<!-- SiteMap 내용 -->
				<div id="mySidenav" class="sidenav">
  					<h1> 사이트 맵 </h1>
  					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  					<h3> 쇼핑하기 </h3>
  					<div class="navImg" >
  					<a href="#"><img src="${contextPath}/resources/img/common/vegi_icon.png"></a>
  					<a href="#"><img src="${contextPath}/resources/img/common/fish_icon.png"></a>
  					<a href="#"><img src="${contextPath}/resources/img/common/meat_icon.png"></a>
  					</div>
  					<div class="shopingNav">
  					<a href="#">농산물</a>
  					<a href="#">수산물</a>
  					<a href="#">축산물</a>
  					</div>
  					<hr>
  					<h3>메뉴</h3>
  					<span class="myPageNav">
  					<a href="#">마이페이지</a><br>
  					<a href="#">장바구니</a><br>
  					<a href="#">공지사항</a><br>
  					<a href="#">고객센터</a>
  					</span>
				</div>
				
				<div class="col-lg-1 text-left" >
					<div class="menu_navi">
						<a href="#" class="header-cart"><img src="${contextPath}/resources/img/common/cart-icon.png"></a>
						<span onclick="openNav()" class="header-navi"><img src="${contextPath}/resources/img/common/site-map-icon.png"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<script>
/* Set the width of the side navigation to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "500px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
