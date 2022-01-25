<!-- 2021.12.03 임석희 adminOrder -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="9" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${orderList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${orderList}" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test='${not empty pageNo}'>
	<script>
	
		window.addEventListener('load',function() {
			if(document.getElementById("${pageNo}")) {
			document.getElementById("${pageNo}").style.fontFamily = "kopub_bold";
			document.getElementById("${pageNo}").style.fontSize = "15px";
			}
		});


	</script>
</c:if>
<c:if test='${not empty message }'>

	<script>
		alert("${message}");
	</script>
	<%
	session.removeAttribute("message");
	%>
</c:if>

<c:if test='${not empty userInfo}'>
	<script>
   if(${userInfo.user_rank > 1}) {

   }
   
   else {
         alert("잘못된 접근입니다.");
         location.replace('${contextPath}/main.do');
      }
   </script>

</c:if>
<c:if test='${empty userInfo }'>
	<script>

      alert("잘못된 접근입니다.");
      location.replace('${contextPath}/main.do')

   </script>

</c:if>

<div class="container">

    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">관리자 페이지</h1></div>
    </div>
		
    	<div class="row">
    		<div class="col-lg-12 text-left myPage_03_01-content-body">
    			<h6 class="order_01-sub-title-page">
    				<a href="${contextPath}/admin/order/order_list.do" class="order_01-sub-title adminOrder_hov">주문 관리</a>
    				<a href="${contextPath}/admin/order/return_list.do" class="order_01-sub-title adminOrder_hov" style="margin-left: 50px;">반품 / 교환</a>
    			</h6>    			    		
   			</div>
	    </div>

    
    
    <div class="row">
        <div class="col-lg-3 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)">
        			<option value="all_order">전체 주문</option>
        			<option value="date">주문 일자</option>
        			<option value="id">회원 아이디</option>
			        <option value="product">주문 상품</option>
			        <option value="delivery">배송 상태</option>
        		</select>
        </div>
		<div class="col-lg-6 text-center adminUser_01-content-header">
		
			<select id="search_option_rank" class="adminUser_01-select-box-lookup">
				<option value="guest">상품 준비중</option>
				<option value="user">상품 배송중</option>
				<option value="admin">배송 완료</option>
			</select>
		
			<div id="adminProduct_01-productUpDate">
				<input id="adminProduct_01-productUpDate-begin" type="date"> 부터 
				<input id="adminProduct_01-productUpDate-end" type="date"> 까지
			</div>
			
			<div id="adminProduct_01-productUpDate_search">
				검색할 키워드 : <input id="adminProduct_01-productName-text" type="text">
			</div>

		</div>
        <div class="col-lg-3 text-right adminUser_01-content-header">
        	<input class="adminProduct_01-header-button" type="button" value="조회하기" onclick="search_product_to_option()">
        </div>
    </div>
    
   <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원아이디</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 내역</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">수량</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">결제 금액</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 일자</h6>
	    </div>
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">배송 상태 수정</h6>
	    </div>
	</div>
	
	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">등록된 주문이 없습니다.</div>
	</c:if>
	
	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">
		
	<div class="row">
        <div class="col-lg-2 text-center adminProduct_01-content-item">
        	<div>${itemList[j].user_id}</div>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	${itemList[j].product_main_title}
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	<fmt:formatNumber value="${itemList[j].order_amount}" /> 개
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	<fmt:formatNumber value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" /> 원
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	${itemList[j].order_date}
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        		<select name="yeer" class="MyPage_03_yeer text-center">
        			<option value="none">[배송 상태]</option>
        			<option value="상품준비중">[상품 준비 중]</option>
	        		<option value="상품배송중">[상품 배송 중]</option>
        		</select>
        	<input class="AdminOrder_boxsize" type="button" value="변경">
        </div>
    </div>
			</c:if>

		</c:forEach>
		
			<c:if test="${itemSize > pageNoMax}">

				<div class="row">

					<div class="col-lg-12 text-center admin_product_page_index">
						<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>
						<c:if test="${itemSize > pageNoMax}">
						
							<c:set var="maxNo" value="${itemSize+pageNoMax-1}" />
							
							<c:forEach var="x" begin="1" end="${maxNo / pageNoMax}">
								<fmt:parseNumber type="number" integerOnly="true" var="noFlag" value="${(pageNo+pageNoMax-1) / pageNoMax}" />
							
								<c:if test="${(noFlag * pageNoMax) - (pageNoMax-1) <= x and x <= (noFlag * pageNoMax)}">
									<a href="#" onclick="pageMove(this.id)" id="${x}">${x}</a>
								</c:if>
							</c:forEach>
							
						</c:if>

						<a href="#" onclick="pageMove(this.id)" id="다음">다음</a>
					</div>
					
				</div>

			</c:if>
					
	</c:if>
    
</div>

