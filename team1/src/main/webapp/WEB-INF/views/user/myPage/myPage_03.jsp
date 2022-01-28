<!-- 2021.11.30 임석희 myPage_03 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="5" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${orderList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${orderList}" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty pageNo}'>
	<script>
		window
				.addEventListener(
						'load',
						function() {
							if (document.getElementById("${pageNo}")) {
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

<div class="container">

	<div class="MyPage_title">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 text-center">
				<h1 class="page_title">마이 페이지</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center">
			
			<c:if test='${userInfo.user_membership == 1 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/basic_member_icon.png" alt="회원정보수정페이지 일반회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 2 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/under_member_icon.png" alt="회원정보수정페이지 우수회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 3 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/top_member_icon.png" alt="회원정보수정페이지 단골회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 4 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/flex_member_icon.png" alt="회원정보수정페이지 FLEX회원 이미지">
			</c:if>									
				
			</div>
			<div class="col-lg-10 text-left MyPage_padding">주문 / 배송조회</div>

			<div class="container">
				<div class="MyPage_top-underline"></div>
			</div>
		</div>
	</div>


	<div class="row">

		<div class="col-lg-3 text-center adminUser_01-content-header">
			주문 일자</div>

		<div class="col-lg-6 text-center adminUser_01-content-header">

			<div id="search_option_date_mypage">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>

		</div>

		<div class="col-lg-3 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기" onclick="search_order_to_date()">

		</div>
	</div>

	<div class="MyPage_03_center-box text-center">
		<div class="row">
			<div class="col-lg-2">주문 일자</div>
			<div class="col-lg-3">상품명</div>
			<div class="col-lg-1">수량</div>
			<div class="col-lg-2">결제금액</div>
			<div class="col-lg-2">주문 상태</div>
			<div class="col-lg-2">변경</div>
		</div>
	</div>

	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">조회된 주문내역이 없습니다.</div>
	</c:if>

	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">

				<div class="MyPage_03_center-box-01 text-center">
					<div class="row">
					<input type="hidden" value="${itemList[j].order_id }" id="orderID_${j}">
					<input type="hidden" value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" id="orderAmount_${j}">
						<div class="col-lg-2 text-center">
								<div class=" "><fmt:formatDate value="${itemList[j].order_date}" pattern="yyyy-MM-dd" /></div>
							<input class="MyPage_03-submit-box-01" type="button"
								value="주문 상세 정보">
						</div>
						
						<div class="col-lg-3 MyPage_03_text_position_02">
							<a href="${contextPath}/product/productDetail.do?product_id=${itemList[j].product_id}">${itemList[j].product_main_title}</a>
						</div>
						<div class="col-lg-1 MyPage_03_text_position_02"><fmt:formatNumber value="${itemList[j].order_amount}" /> 개</div>
						<div class="col-lg-2 MyPage_03_text_position_02"><fmt:formatNumber value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" /> 원</div>
						

							<c:if test='${itemList[j].order_state == 0}'>
							<div class="col-lg-2">
								<div class="text-center MyPage_03_text_position_02">상품 준비 중</div>
							</div>
							<div class="col-lg-2">
									<input class="MyPage_03-submit-box-02 MyPage_03_text_position_02" type="button"
										value="주문 취소" onclick="order_cancel()">
							</div>
							</c:if>

							<c:if test='${itemList[j].order_state == 1}'>
							<div class="col-lg-2">
								<div class="text-center MyPage_03_text_position_02">상품 배송 중</div>
							</div>
							<div class="col-lg-2">
								<input class="MyPage_03-submit-box-02" type="button"
									value="배송 조회" onclick="checkDelivery('${itemList[j].order_delivery_id}')">
								<input class="MyPage_03-submit-box-02" type="button" id="updateBtn_${j}"
									value="구매 확정" onclick="update_state(this.id)">
							</div>
							</c:if>						

							<c:if test='${itemList[j].order_state == 2}'>
							<div class="col-lg-2  ">
								<div class="text-center MyPage_03_text_position_02">배송 완료</div>
							</div>
							<div class="col-lg-2">
									<input class="MyPage_03-submit-box-02" type="button" value="반품 / 교환 신청" onclick="order_cancel()"> 
									<input class="MyPage_03-submit-box-02" type="button" value="상품 후기" onclick="order_cancel()">
							</div>

							</c:if>


						
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
							<fmt:parseNumber type="number" integerOnly="true" var="noFlag"
								value="${(pageNo+pageNoMax-1) / pageNoMax}" />

							<c:if
								test="${(noFlag * pageNoMax) - (pageNoMax-1) <= x and x <= (noFlag * pageNoMax)}">
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

<script>
//페이지 이동 스크립트
function pageMove(no) {
	var getValue = 0;
	var lastPage = parseInt(${itemSize+pageNoMax-1} / ${pageNoMax});
	if(no == "이전" || no == "다음") {
		var uriValue = window.location.search;
		
		var array = uriValue.split("pageNo=");
		if(array[1] == "" || array[1] == null) {
			array[1] = 1;
		}
		getValue = array[1];
	}
	
	if(no == "이전") {
		if(getValue == 1) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/myPage/myOrder.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/myPage/myOrder.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/myPage/myOrder.do?pageNo='+no;
	}
}

function checkDelivery(order_delivery_id) {
	
	var url = "https://tracker.delivery/#/kr.epost/"+order_delivery_id;
	var name = "바로입 프로젝트";
	var option = "width = 500, height = 500, top = 200, left = 700, location = no, directories = no, resizable = no, menubar = no, scrollbars = no, toolbars = no, status = no";

	alert("가상의 송장번호로, 정확한 배송조회가 되지 않습니다.");
	window.open(url, name, option);
	
	
	
}

// 구매확정 스크립트
function update_state(target) {
	var strArray = target.split('_');
	var target_no = strArray[1];
	
	let order_id = document.getElementById('orderID_'.concat(target_no)).value;
	let order_amount = document.getElementById('orderAmount_'.concat(target_no)).value;
	let user_id = "${userInfo.user_id}";
	let point = "";
	
    switch("${userInfo.user_membership}") {
    case "1" :
    	point = order_amount * 0.01
       break;
    
    case "2" :
    	point = order_amount * 0.03
       break;
       
    case "3" :
    	point = order_amount * 0.05
       break;
       
    case "4" :
    	point = order_amount * 0.1
	   break;
    }
	
	
	
		let submitFlag = confirm("해당 주문을 구매확정 처리 하시겠습니까?");
		
		if(submitFlag) {
			$.ajax({
				type : "post",
				async : false,
				url : "${contextPath}/myPage/deliveryCompleted.do",
				dataType : "text",
				data : {
					"order_id" : order_id,
					"point" : point,
					"user_id" : user_id
				},
				success : function(message) {
					alert(message);
			 		location.reload();
				},
				error : function() {
					alert("구매확정에 문제가 발생하였습니다.");
				}

			});	
		}
				
}

function search_order_to_date() {

	let beginDate = document.getElementById('search_option_date_begin').value;
	let endDate = document.getElementById('search_option_date_end').value;
	let searchDate = beginDate.concat(',', endDate);

		if(endDate == "" || beginDate == "") {
			alert("정확한 조회 기간을 입력해주세요.");
		}
		else if(beginDate > endDate) {
			alert("조회 기준일이 종료일보다 클 수 없습니다.")
		}
		else {
			location.href='${contextPath}/myPage/myOrder.do?search_option=orderDate&search_value='+searchDate;

		}

	
}

window.addEventListener('load', function() {
	
	   if(${search_option != null && search_option != ""}) {
	    
	    var begin = "";
	    var end = "";

	    	var splitDate = "${search_value}".split(",");

	    	document.getElementById("search_option_date_begin").value = splitDate[0];
	    	document.getElementById("search_option_date_end").value = splitDate[1];
	     
	    
	   }

	});
</script>
