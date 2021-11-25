<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container-fluid">

    <div class="row">
        <div class="col-lg-6 offset-lg-3 text-center">
        	<h1 class="page_title">회원가입</h1>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-10 offset-lg-1 text-center">
        <h2 class="join-sub-title">01. 약관동의 > <span class="join_01-sub-title">02. 정보입력</span></h2>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-8 offset-lg-2">
        	<div class="join_02-top">
        		가입정보 입력
        	</div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	아이디
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="중복 확인">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	비밀번호
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="password">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	비밀번호 확인
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="password">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	이름
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	생년월일
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<select id="id" onchange="javascript:lastday();"></select>
        		<select id="id" onchange="javascript:lastday();"></select>
        		<select id="id" onchange="javascript:lastday();"></select>
        	</form>
        </div>
    </div>
    
</div>

<!-- javascript -->
<!-- 생년월일 함수 -->

