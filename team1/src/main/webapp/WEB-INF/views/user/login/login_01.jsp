<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="java.net.URLEncoder, java.security.SecureRandom, java.math.BigInteger"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test='${not empty message }'>
<script>
	alert("${message}");
</script>
</c:if>

<div class="container">

	<div class="row">
		<div class="col-lg-2 offset-lg-5 text-center">
			<h1 class="page_title">로그인</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<h3 class="sub-title">아이디 로그인</h3>
			<form id="login_01_loginForm" <%--action="${contextPath}/user/login.do"--%> name="Login_01_LoginForm" method="post">
				<input class="login_01-id-box" name="user_id" type="text"
					placeholder="아이디(이메일)를 입력해주세요."> 
				<input class="login_01-pwd-box" name="user_pw" type="password"
					placeholder="비밀번호를 입력해주세요."><br> 
				<input class="login_01-btn" type="button" value="로그인"  <%--onClick="checkLogin()"--%>>
			</form>
			<p class="login_01-id-pwd-find">
				<a href="${contextPath}/user/login_02.do">아이디 / 비밀번호 찾기</a>
			</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<br>
			<br>
			<h3 class="login-title">SNS 간편 로그인</h3>
			<div class="login_01-sns-login-btn">
			<%
			    String clientId = "metNeTJSOQeJYHhl4Gnd"; //애플리케이션 클라이언트 아이디값";
			    String redirectURI = URLEncoder.encode("http://localhost:8080/baroip/main.do", "UTF-8");
			    SecureRandom random = new SecureRandom();
			    String state = new BigInteger(130, random).toString();
			    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    session.setAttribute("state", state);
			 %>
				<a class="login_01-naver-login" href="<%=apiURL%>"> 
					<img class="login_01-naver-kakao-login"
						src="${contextPath}/resources/img/common/naver_login_btn.png"
						alt="로그인페이지 네이버 로그인 버튼 이미지">
				</a> 
				<a class="login_01-kakao-login" href="#"> 
					<img class="login_01-naver-kakao-login"
						src="${contextPath}/resources/img/common/kakao_login_btn.png"
						alt="로그인페이지 카카오 로그인 버튼 이미지">
				</a>
			</div>
			<br>
			<p class="login_01-join-text">
				바로입이 처음이신가요? 
				<a href="${contextPath}/user/join_01.do">회원가입하기</a>
			</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<br>
			<!-- 비회원 주문 조회 버튼 -->
			<div class="login_01-sns-login-btn">
				<a class="login_01-non-member-search" href="#"> 
					<img class="login_01-non-member-search-btn bottom_btn_size"
						src="${contextPath}/resources/img/common/non_member_search_btn.png"
						alt="로그인페이지 비회원 조회 버튼 이미지">
				</a>
			</div>
		</div>
	</div>
	
</div>

<script type="text/javascript">

	/* 로그인 버튼 */
	$(".login_01-btn").click(function() {
		/* alert("로그인 버튼"); */
		$("#login_01_loginForm").attr("action", "${contextPath}/user/login.do");
		$("#login_01_loginForm").submit();
		
	});
	

	/* function checkLogin() {
		var form = document.Login_01_LoginForm;
		
		if(form.user_id.value == "" || form.user_id.length == 0) {
			alert("아이디를 입력해주세요.");
			form.user_id.focus();
			return false;
		}
		else if(form.user_pw.value == "" || form.user_pw.length == 0) {
			alert("비밀번호를 입력해주세요.");
			form.user_pw.focus();
			return false;
		}
		form.submit();
			
	} */

</script>