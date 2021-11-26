<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">

    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center">
        	<h1 class="page_title">주문 / 결제 페이지</h1>
        </div>
        <div class="col-lg-2 offset-lg-1 text-right">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">01. 주문 / 결제</span> > 02. 완료
        	</h6>
        </div>
    </div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
	        <h4 class="order_01-content-hedaer-text">주문 리스트</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	상품 정보
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	수량
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	가격
        </div>
        <div class="col-lg-2  text-center order_01-content-body">
        	할인
        </div>
        <div class="col-lg-2 text-center order_01-content-body">
        	주문 금액
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 order_01-content-item-img">
        	<a href="${contextPath}/product_02.do">
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="주문페이지 상품 이미지">
        	</a>
        	<a class="order_01-item-name" href="${contextPath}/product_02.do">[상품 이름]</a>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 수량]개
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 금액]원
        </div>
        <div class="col-lg-2  text-center order_01-content-item">
        	[할인 금액]원
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[최종 금액]원
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 order_01-content-item-img">
        	<a href="${contextPath}/product_02.do">
        		<img class="cart_image_clip" 
        		src="${contextPath}/resources/img/common/img-box.jpg" alt="주문페이지 상품 이미지">
        	</a>
        	<a class="order_01-item-name" href="${contextPath}/product_02.do">[상품 이름]</a>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 수량]개
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[상품 금액]원
        </div>
        <div class="col-lg-2  text-center order_01-content-item">
        	[할인 금액]원
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[최종 금액]원
        </div>
    </div>
	
	<div class="row">
        <div class="col-lg-3 offset-lg-8 text-right">
        	<div class="order_01-content-item-price">
        		<span>최종 주문 금액</span>
        		<span class="order_01-content-price">배송비</span>
        		<span class="order_01-content-price">[최종 금액 합계]원</span>
        	</div>
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header">
	        <h4 class="order_01-content-hedaer-text">주문자 정보</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-3 offset-lg-1 text-center order_01-content-body">
        	아이디
        </div>
        <div class="col-lg-4 text-center order_01-content-body">
        	이름
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	연락처
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-3 offset-lg-1 text-center order_01-content-item">
        	[회원 아이디]
        </div>
        <div class="col-lg-4 text-center order_01-content-item">
        	[회원 이름]
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[회원 연락처]
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-03">
	        <h4 class="order_01-content-hedaer-text">배송 정보</h4>
	        <hr>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	이 름
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form class="order_01-user-name">
        		<input class="join_02-text-box" type="text">
        		<span class="order_01-check-text">주문자 정보와 동일</span>
        		<input class="order_01-check" type="checkbox" name="join_check_01" value="true">
        		
        	</form>
        </div>
    </div>

	<div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	주 소
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="우편번호 검색">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	상세 주소
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>

	<div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	핸드폰 번호
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<select class="join_02-mobile">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        			<option value="070">070</option>
        		</select> - 
        		<input class="join_02-mobile-02" type="number"> - 
        		<input class="join_02-mobile-02" type="number">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	주문 메세지
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
	        <h4 class="order_01-content-hedaer-text">결제 상세</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	최종 주문 금액
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	보유 포인트
        </div>
        <div class="col-lg-3 text-center order_01-content-body">
        	사용 포인트
        </div>
        <div class="col-lg-2  text-center order_01-content-body">
        	결제 금액
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
        	[최종 금액 합계]
        </div>
        <div class="col-lg-3 text-center order_01-content-item">
        	[보유 포인트 : readOnly]
        </div>
        <div class="col-lg-3 text-center order_01-content-item-point">
        	<form>
        		<input class="order_01-point-box" type="text">
        		<input class="order_01-point-box" type="submit" value="전체 포인트 사용">
        	</form>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[최종 결제 금액]
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-10 offset-lg-1 order_01-content-header order_01-content-04">
	        <h4 class="order_01-content-hedaer-text">결제 방법</h4>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-body">
        	결제 수단
        </div>
        <div class="col-lg-8 text-center order_01-content-body">
        	<form>
        		<input type="radio" name="chk_info" value="card" checked="checked">신용 / 체크 카드
				<input type="radio" name="chk_info" value="bank">무통장 입금
				<input type="radio" name="chk_info" value="mobile">휴대폰 결제
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1 text-center order_01-content-item">
        	세부 내용
        </div>
        <div class="col-lg-8 text-center order_01-content-item">
        	<form>
        		
        	</form>
        </div>
    </div>
    
</div>