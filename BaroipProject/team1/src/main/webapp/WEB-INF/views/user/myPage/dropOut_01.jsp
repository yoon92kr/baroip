<!-- 2021.11.25 임석희 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">마이 페이지</h1></div>
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
    <div class="row">
        <div class="col-lg-2 dropOut_01_text">유의사항</div>
        <div class="col-lg-10">기존의 구매내역 및 보유 포인트는 삭제되며 복구 및 환불이 불가능합니다.<br>
        					   이점을 반드시 인지해주시고, 회원 탈퇴에 있어 문의사항이 있으실 경우 고객센터 및 실시간 채팅을 이용하여<br>
        					   정확한 내용을 안내 받으신 뒤, 회원 탈퇴를 진행하실것을 권해드립니다.</div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 dropOut_01_text">탈퇴 확인</div>
        <div class="col-lg-8">회원 탈퇴를 이어서 진행하시기 위해서는 아래의 문구를 동일하게 기입해주시길 바랍니다.</div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 dropOut_01_text">문구 입력</div>
        <input class="col-lg-offset-1 col-lg-7 MyPage_02_password_box" type="text"></div>
</div>
		