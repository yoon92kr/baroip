<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

    <div class="row">
        <div class="col-lg-8 offset-lg-2 text-center">
        	<h1 class="page_title">마이 페이지</h1>
        </div>
	</div>
	
	<div class="row">
        <div class="col-lg-12 text-left myPage_03_01-content-body">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">회원 관리</span>
        	</h6>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup">
        			<option value="회원 등급">회원 등급</option>
        			<option value="가입일">가입일</option>
        			<option value="최종 접속일">최종 접속일</option>
        			<option value="특정 아이디">특정 아이디</option>
        			<option value="생년월일">생년월일</option>
        		</select>
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 기준
        	<select class="adminUser_01-select-box-lookup">
        			<option value="회원 등급">회원 등급</option>
        			<option value="가입일">가입일</option>
        			<option value="최종 접속일">최종 접속일</option>
        			<option value="특정 아이디">특정 아이디</option>
        			<option value="생년월일">생년월일</option>
        		</select>
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	<input class="adminUser_01-button-top" type="button" value="조회하기">
        	<input class="adminUser_01-button-top" type="button" value="삭제하기">
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">회원 아이디</h6>
	    </div>
	    <div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">회원 등급</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">누적 구매액</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">누적 구매 건수</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">최초 가입일</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">최종 접속일</h6>
	    </div>
	    <div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info">
	        <h6 class="order_01-content-hedaer-text">회원 수정</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 text-center adminUser_01-member-change-item-name">
        	<div>[회원 아이디]</div>
        	<input class="adminUser_01-member-detail-lookup-btn" type="button" value="회원 상세 정보">
        </div>
        <div class="col-lg-1 text-center adminUser_01-member-change-item">
        	[회원 등급]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 누적 구매액]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 누적 구매 건수]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 가입일]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 접속일]
        </div>
        <div class="col-lg-1 adminUser_01-member-change-item">
        	<input class="adminUser_01-member-change-btn" type="button" value="회원 정보 수정">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	<div>[회원 아이디]</div>
        	<input class="adminUser_01-member-detail-lookup-btn" type="button" value="회원 상세 정보">
        </div>
        <div class="col-lg-1 text-center adminUser_01-member-change-item">
        	[회원 등급]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 누적 구매액]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 누적 구매 건수]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 가입일]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 접속일]
        </div>
        <div class="col-lg-1 adminUser_01-member-change-item">
        	<input class="adminUser_01-member-change-btn" type="button" value="회원 정보 수정">
        </div>
    </div>

</div>

<script type="text/javascript">
function selectPay(selectId) {
	   let card = '#order_01-selectPay-card-text';
	   let noBank = '#order_01-selectPay-noBank-text';
	   let mobile = '#order_01-selectPay-mobile-text';

	   let targetPay =  '#'.concat(selectId, '-text');

	   if (targetPay == card) {
	      document.querySelector(card).style.display = 'inline';
	      document.querySelector(noBank).style.display = 'none';
	      document.querySelector(mobile).style.display = 'none';
	   }

	   else if (targetPay == noBank) {
	      document.querySelector(card).style.display = 'none';
	      document.querySelector(noBank).style.display = 'inline';
	      document.querySelector(mobile).style.display = 'none';
	   }

	   else if (targetPay == mobile) {
	      document.querySelector(card).style.display = 'none';
	      document.querySelector(noBank).style.display = 'none';
	      document.querySelector(mobile).style.display = 'inline';
	   }
	   
	}
</script>