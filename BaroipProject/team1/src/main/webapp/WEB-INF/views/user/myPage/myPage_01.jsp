<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center haha"><h1 class="page_title">마이 페이지</h1></div>
    </div>
</div>

<div class="container">
	<div class="MyPage_01">
	<div class="MyPage_welcome">
    	<div class="row">
    		<div class="col-lg-2 text-left"><img src="${contextPath}/resources/img/common/normalgamja.png"></div>
    		<div class="col-lg-10 text-left">환영합니다 <회원 이름> 님!</div>

        </div>
        </div>
        
			<div class="MyPage_01_title">
				<div class="row">
        		<div class="col-lg-3 text-center">회원등급</div>
        		<div class="col-lg-3 text-center">주문내역</div>
        		<div class="col-lg-3 text-center">장바구니</div>
        		<div class="col-lg-3 text-center">포인트</div>
    		</div>
    		
    		<div class="MyPage_01_content">
    		<div class="row">
        		<div class="col-lg-3 text-center"><현재 회원등급></div>
        		<div class="col-lg-3 text-center"><회원 주문내역 건수></div>
        		<div class="col-lg-3 text-center"><회원 장바구니 건수></div>
        		<div class="col-lg-3 text-center"><회원 잔여 포인트></div>
    		</div>
    		
    		<div class="row">
    		<div class="col-lg"><hr></div>
			</div>
    	</div>                                   
    </div>                                       
</div>
</div>                                              
                                                    