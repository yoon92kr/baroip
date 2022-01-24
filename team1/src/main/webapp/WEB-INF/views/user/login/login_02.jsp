<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>
</c:if>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4 text-center">
			<h1 class="page_title login_02-title">아이디 / 비밀번호 찾기</h1>
		</div>
	</div>
</div>
<div class="login_02-main">

	<div class="row">
		<div class="col-lg-4 offset-lg-2 text-center border-right border">
			<div class="login_02-top">아이디 찾기</div>
			<form id="userIdFindForm">
				<input id="IdFindUserName" class="login_02-id-find" type="text" name="user_name" placeholder="이름을 입력해주세요."> 
				<input id="idFundUserMobile" class="login_02-id-find" type="text" name="user_mobile" placeholder="핸드폰 번호를 입력해주세요." oninput="autoMobileNum(this)"> 
				<input id="login_02_userIdFind" class="login_02-btn login_02-id-btn" type="button" value="아이디 찾기" onclick="idFind();">
			</form>
		</div>
		<div class="col-lg-4 text-center border-left border">
			<div class="login_02-top">비밀번호 찾기</div>
			<form id="userPwdFindForm">
				<input id="login_02_pwd_find" class="login_02-pwd-find" type="text" name="user_id" placeholder="아이디를 입력해주세요.">
				<input id="login_02_pwdFindMobile" class="login_02-pwd-find" type="text" name="user_mobile" oninput="autoMobileNum(this)" placeholder="핸드폰 번호를 입력해 주세요.">
				<input id="login_02_pwdFindEmail" class="login_02-pwd-find" name="user_email" type="hidden">
				<input id="login_02_pwdFindMobile_btn" class="login_02-btn login_02-pwd-btn-01" type="button" value="휴대폰 인증" onclick="pwdCertification(this.id);"> 
				<input id="login_02_pwdFindEmail_btn" class="login_02-btn login_02-pwd-btn-02" type="button" value="이메일 인증" onclick="pwdCertification(this.id);">
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<a href="${contextPath}/user/login_01.do"> 
				<input class="cart_btn_gray login_02_btn" type="button" value="로그인 페이지">
			</a>
		</div>
	</div>

</div>

<script>
	
	let autoMobileNum = (target) => {
		target.value = target.value
		   .replace(/[^0-9]/, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}

	function idFind() {
		userName = document.getElementById("IdFindUserName");
		userMobile = document.getElementById("idFundUserMobile");
		findFrom = document.getElementById("userIdFindForm");
		
		if(userName.value == "") {
			alert("이름을 입력해 주세요.");
			userName.focus();
			return false;
		} else if(userMobile.value == "") {
			alert("핸드폰 번호를 입력해 주세요.");
			userMobile.focus();
			return false;
		} else {
			findFrom.action = "${contextPath}/user/userIdFind.do";
			findFrom.method = "post";
			findFrom.submit();
		}
	} 
	
	function pwdCertification(btnid) {
		
		let mobileCheck = document.getElementById("login_02_pwdFindMobile");
		let emailCheck = document.getElementById("login_02_pwdFindEmail");
		
		if(document.getElementById("login_02_pwd_find") =="") {
			alert("아이디를 입력해 주세요.");
			document.getElementById("login_02_pwd_find").focus();
			return false;
		} else {
			if(btnid == "login_02_pwdFindMobile_btn") {
				mobileCheck.type="text";
				emailCheck.type="hidden";
				mobileCheck.placeholder="핸드폰 번호를 입력해 주세요.";
				if(mobileCheck == "") {
					alert("핸드폰 번호를 입력해 주세요.");
					mobileCheck.focus();
					return false;
				}else {
					$.ajax({
						url:""
					})
				}
			}
			if(btnid == "login_02_pwdFindEmail_btn") {
				mobileCheck.type="hidden";
				emailCheck.type="email";
				emailCheck.placeholder="가입당시 이메일을 입력해 주세요.";
				if(emailCheck == "") {
					alert("가입당시 이메일을 입력해 주세요.");
					emailCheck.focus();
					return false;
				}
			}
		}
	}
	
</script>