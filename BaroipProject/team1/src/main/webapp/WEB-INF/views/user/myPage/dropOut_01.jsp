<!-- 2021.11.25 임석희 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center MyPage_padding"><h1 class="page_title">마이 페이지</h1></div>
    </div>
</div>

<div class="container">
	<div class="MyPage_title MyPage_welcome">
		<div class="row">
			<div class="col-lg-10 text-left MyPage_padding" style="margin-left: 20px;">회원 탈퇴</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="dropOut_01_sub">
    <div class="row">
        <div class="col-lg-offset-2 col-lg-3 col-lg-offset-1">유의사항</div>
        <div class="col-lg-offset-2 col-lg-3 col-lg-offset-0 col-lg-7"></div>
    </div>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-3">탈퇴 확인</div>
        <div class="col-lg-7">회원 탈퇴를 이어서 진행하시기 위해서는 아래의 문구를 동일하게 기입해주시길 바랍니다.</div>
    </div>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-3">문구 입력</div>
        <div class="col-lg-7"></div>
    </div>
</div>
		