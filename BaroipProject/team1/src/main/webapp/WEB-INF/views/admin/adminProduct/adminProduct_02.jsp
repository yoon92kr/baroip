<!-- 2021.12.02 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

    <div class="row">
        <div class="col-lg-6 offset-lg-3 text-center">
        	<h1 class="page_title">관리자 페이지</h1>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-12 text-left myPage_03_01-content-body">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">회원 상세 정보</span>
        	</h6>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	메인 상품명
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	상품 부제목
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	메인 정보
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<span class="adminProduct_02-content-body-left-text">상품금액 : </span>
        		<input class="adminProduct_02-content-body-mainInfo" type="text">
        		할인금액 : <input class="adminProduct_02-content-body-mainInfo" type="text">
        		최종금액 : <input class="adminProduct_02-content-body-mainInfo" type="text" disabled>
        		재고수량 : <input class="adminProduct_02-content-body-mainInfo" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	상품 분류
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<span class="adminProduct_02-content-body-left-text">대분류</span>
        		<select class="adminProduct_02-category">
        			<option value="010">농산물</option>
        			<option value="011">수산물</option>
        			<option value="070">축산물</option>
        		</select>
        		
        		<span class="adminProduct_02-content-body-left-text adminProduct_02-content-body-category-text">소분류</span>
        		<select class="adminProduct_02-category">
        			<option value="010">채소</option>
        			<option value="011">곡물</option>
        			<option value="016">과일</option>
        		</select>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center adminProduct_02-main-content-left">
        	내용
        </div>
        <div class="col-lg-10 adminProduct_02-main-right">
        	<input class="adminProduct_02-main-content-file" type="file">
        	<textarea class="adminProduct_02-main-content-text"></textarea>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-4 offset-lg-2 join_02-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="join_01-back" href="${contextPath}/adminUser_01.do">
					<img class="join_01-btn-img bottom_btn_size" src="${contextPath}/resources/img/common/user_list_btn.png" alt="회원 목록 이동 버튼 이미지">
			    </a>
		    </div>
        </div>
		<div class="col-lg-4 join_02-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="adminUser_02-btn-color" href="javascript:userInfoCange()">
					<img class="bottom_btn_size join_01-btn-img" src="${contextPath}/resources/img/common/user_info_change_btn.png" alt="회원정보 수정 버튼 이미지">
			    </a>
		    </div>
        </div>
    </div>

</div>
