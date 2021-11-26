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
        	<h6 class="order_01-sub-title-all">
        		<span class="order_01-sub-title">01. 주문 / 결제</span> > 02. 완료
        	</h6>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-10 offset-lg-1">
        	<h4 class="order_01-cart-list-title">주문 리스트</h4>
        	<hr class="order_01-cart-list-underbar">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1">
        	<span class="order_01-cart-list-info">상품정보</span>
        </div>
        <div class="col-lg-2 text-center">
        	수량
        </div>
        <div class="col-lg-2 text-center">
        	가격
        </div>
         <div class="col-lg-2 text-center">
        	할인
        </div>
        <div class="col-lg-2 text-center">
        	주문 금액
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 offset-lg-1">
        	<img class="order_01-item-img" src="${contextPath}/resources/img/common/img-box.jpg">
        	<span class="order_01-item-name">[상품 이름]</span>
        </div>
        <div class="col-lg-2 text-center order_01-cart-list-body-text">
        	[상품 수량]개
        </div>
        <div class="col-lg-2 text-center order_01-cart-list-body-text">
        	[상품 금액]원
        </div>
         <div class="col-lg-2 text-center order_01-cart-list-body-text">
        	[할인 금액]원
        </div>
        <div class="col-lg-2 text-center order_01-cart-list-body-text">
        	[최종 금액] 원
        </div>
    </div>
    
</div>