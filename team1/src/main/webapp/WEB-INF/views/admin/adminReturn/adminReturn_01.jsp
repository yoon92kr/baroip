<!-- 2021.12.02 임석희 adminReturn_01 -->

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
    				<a href="${contextPath}/admin/order/order_list.do" class="adminOrder_hov">주문 관리</a>
    				<a href="${contextPath}/admin/order/return_list.do" class="order_01-sub-title adminOrder_hov" style="margin-left: 50px;">반품 / 교환</a>
    			</h6>    			    		
   			</div>
	    </div>
   
    <div class="row">
        <div class="col-lg-3 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)" id="search_option_category">
        			<option value="all">전체</option>
        			<option value="orderDate">접수 일자</option>
        			<option value="userId">아이디</option>
			        <option value="productId">주문 번호</option>
        		</select>
        </div>
		<div class="col-lg-6 text-center adminUser_01-content-header">

			<div id="search_option_date">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>
			
			<div id="search_option_id_box">
				검색할 아이디 : <input id="search_option_id" class="adminUser_01-select-box-lookup" type="text" onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_order_to_option();}">
			</div>
			
			<div id="search_option_product_box">
				검색할 주문 번호 : <input id="search_option_product" class="adminUser_01-select-box-lookup" type="text" onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_order_to_option();}">
			</div>
		

		</div>
        <div class="col-lg-3 text-right adminUser_01-content-header">
        	<input class="adminProduct_01-header-button" type="button" value="조회하기" onclick="search_order_to_option()">
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원아이디</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 내역</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">결제 금액</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">반품 / 교환 사유</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">승인 / 거절</h6>
	    </div>
	</div>
    
	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">반품 / 교환 요청이 없습니다.</div>
	</c:if>    
	
	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">
			    
   	<div class="AdminReturn_center-box-01 text-center">
	<div class="row">
        <div class="col-lg-2 text-center">
        	<div>[회원아이디]</div>
        	<input class="MyPage_03-submit-box-01" type="button" value="반품 신청서 확인" onclick="location.href='${contextPath}/adminReturn_02.do'">
        	<input class="MyPage_03-submit-box-01" type="button" value="주문 상세 정보" onclick="location.href='${contextPath}/myPage_03_01.do'">
        </div>
        	<div class="col-lg-2 MyPage_03_text_position_04">[주문 상품 명]</div>
        	<div class="col-lg-2 MyPage_03_text_position_04">[결제 금액]</div>
        	<div class="col-lg-2 MyPage_03_text_position_04">[반품 / 교환 사유]</div>
        	<div class="col-lg-2 MyPage_03_text_position_03">
        <div>
        	<input class="MyPage_03-submit-box-01" type="button" value="수 락" onclick="order_cancel()">
        	<input class="MyPage_03-submit-box-01" type="button" value="거 절" onclick="order_cancel()">
        </div>
        	</div>
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

<script type="text/javascript">
function selectLookup(selectValue) {
	
    let adminUser_01_member_ranking = '#adminUser_01-member-ranking-text';
    let adminUser_01_member_joinDate = '#adminUser_01-member-date-text';
    let adminUser_01_member_lastAccess = '#adminUser_01-member-date-text';
    let adminUser_01_member_id = '#adminUser_01-member-id-text';
    let adminUser_01_member_birthYear = '#adminUser_01-member-date-text';

    let adminUser_member = '#adminUser_01-member-'.concat(selectValue, '-text');


    if (adminUser_member == adminUser_01_member_ranking) {
       document.querySelector(adminUser_01_member_ranking).style.display = 'inline';
       document.querySelector(adminUser_01_member_joinDate).style.display = 'none';
       document.querySelector(adminUser_01_member_lastAccess).style.display = 'none';
       document.querySelector(adminUser_01_member_birthYear).style.display = 'none';
       document.querySelector(adminUser_01_member_id).style.display = 'none';
    }
    else if (adminUser_member == adminUser_01_member_id) {
       document.querySelector(adminUser_01_member_id).style.display = 'inline';
       document.querySelector(adminUser_01_member_ranking).style.display = 'none';
       document.querySelector(adminUser_01_member_joinDate).style.display = 'none';
       document.querySelector(adminUser_01_member_lastAccess).style.display = 'none';
       document.querySelector(adminUser_01_member_birthYear).style.display = 'none';
    }
    else if (adminUser_member == adminUser_01_member_joinDate || adminUser_01_member_lastAccess || adminUser_01_member_birthYear) {
       document.querySelector(adminUser_01_member_joinDate).style.display = 'inline';
       document.querySelector(adminUser_01_member_lastAccess).style.display = 'inline';
       document.querySelector(adminUser_01_member_birthYear).style.display = 'inline';
       document.querySelector(adminUser_01_member_ranking).style.display = 'none';
       document.querySelector(adminUser_01_member_id).style.display = 'none';
    }

 }
</script>