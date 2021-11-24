<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
	<div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4 text-center">
        	<h1 class="login_03-id-find-title">아이디 찾기</h1>
        </div>
        <div class="col-lg-4"></div>
    </div>
	<div class="row">
		<div class="col-lg-4"></div>
	    <div class="col-lg-4 text-center">
	    	<h4 class="login_03-lookup">아이디 조회 완료</h4>
	    </div>
	    <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10 text-center">
        	<h3 class="login_03-id-text"><회원 이름>님이 가입하신 아이디는 
        	<span class="login_03-user-id"><회원 아이디></span> 입니다.</h3>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <div class="row">
        <div class="col-lg-6 text-right">
        	<button class="login_03-id-pwd-find login_03-btn" type="button">
        		<a href="#">아이디 / 비밀번호 찾기</a>
        	</button>
        </div>
        <div class="col-lg-6 text-left">
        	<button class="login_03-login-page login_03-btn" type="button">
        		<a href="#">로그인 페이지</a>
        	</button>
        </div>
    </div>
</div>