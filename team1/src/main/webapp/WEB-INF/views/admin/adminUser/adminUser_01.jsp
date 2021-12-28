<!-- 2021.11.30 한건희 -->
<!-- 2021.12.28 윤상현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
		<div class="col-lg-8 offset-lg-2 text-center">
			<h1 class="page_title">관리자 페이지</h1>
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
	
		<div class="col-lg-3 text-center adminUser_01-content-header">
			조회 기준 <select class="adminUser_01-select-box-lookup"
				onchange="selectLookup(this.value)">
				<option value="rank">회원 등급</option>
				<option value="joinDate">가입일</option>
				<option value="lastAccess">최종 접속일</option>
				<option value="userId">아이디</option>
			</select>
		</div>
		
		<div class="col-lg-6 text-center adminUser_01-content-header">
		
			<select id="search_option_rank" class="adminUser_01-select-box-lookup">
				<option value="일반">비회원</option>
				<option value="우수">회원</option>
				<option value="단골">관리자</option>
			</select> 
			
			<div id="search_option_date">
				<input id="search_option_date_begin" class="adminUser_01-select-box-lookup" type="date"> 부터 
				<input id="search_option_date_end" class="adminUser_01-select-box-lookup" type="date"> 까지
			</div>
			<div id="search_option_text_box">
			검색할 키워드 : <input id="search_option_text" class="adminUser_01-select-box-lookup" type="text">
			</div>
		</div>
		
		<div class="col-lg-3 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기" onclick="search_user_to_option()">

		</div>
	</div>

	<div class="row">
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">회원 아이디</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">회원 등급</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">누적 구매액</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">최초 가입일</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">최종 접속일</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상태 변경</h6>
		</div>
	</div>
	
<c:if test="${empty userList}">
	<br>
	<div class="col-lg-12 text-center">조회된 회원이 없습니다.</div>
</c:if>

<c:if test="${not empty userList}">
<c:forEach var="userVO" items="${userList}" varStatus="status">

<c:if test="${not empty userList && status.count <8}">

<div class="row">
		<div class="col-lg-2 text-center adminUser_user_list_form">
			<div>${userVO.user_id}</div>

		</div>

			<c:if test="${userInfo.user_rank == 4 }"> 
					<div class="col-lg-2 text-center adminUser_user_list_form_rank">
				<select class="product_states_select" id="product_state_${status.count}">

				<option value="0" <c:if test='${userVO.user_rank == "0"}'>selected</c:if>>비회원</option>
				<option value="1" <c:if test='${userVO.user_rank == "1"}'>selected</c:if>>일반회원</option>
				<option value="2" <c:if test='${userVO.user_rank == "2"}'>selected</c:if>>일반 관리자</option>
				<option value="3" <c:if test='${userVO.user_rank == "3"}'>selected</c:if>>상품 관리자</option>
				<option value="4" <c:if test='${userVO.user_rank == "4"}'>selected</c:if>>총 책임자</option>			
				</select> <input class="admin_01-itemCountBox-btn" id="${status.count}" type="button"
				value="변경" onclick="update_states(this.id)">
						</div>
			</c:if>
			<c:if test="${userInfo.user_rank < 4 }" >
			<div class="col-lg-2 text-center adminUser_user_list_form">
				<c:if test='${userVO.user_rank == "0"}'>비회원</c:if>
				<c:if test='${userVO.user_rank == "1"}'>일반회원</c:if>
				<c:if test='${userVO.user_rank == "2"}'>일반 관리자</c:if> 
				<c:if test='${userVO.user_rank == "3"}'>전체 관리자</c:if>
				<c:if test='${userVO.user_rank == "4"}'>총 책임자</c:if>
				
				</div>
			</c:if>	
			
				

		<div class="col-lg-2 text-center adminUser_user_list_form">${userVO.user_total_amount}</div>
		<div class="col-lg-2 text-center adminUser_user_list_form">${userVO.user_join_date}</div>
		<div class="col-lg-2 text-center adminUser_user_list_form">${userVO.user_last_date}</div>
		<div class="col-lg-2 text-center adminUser_user_list_form_edit">
			<input class="adminProduct_01-product adminProduct_01-product-top " 
				type="button" value="회원 수정" id="${status.count}"
				onclick="update_product_form(this.id)"> <input
				class="adminProduct_01-product" id="${status.count}" type="button"
				value="회원 삭제" onclick="delete_product(this.id)">

		</div>
	</div>
	</c:if>
				<c:if test="${status.count == userList.size() && userList.size() > 7}">
				
				<div class="row">
				
					<div class="col-lg-12 text-center admin_product_page_index">
						<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>
						<c:if test="${userList.size() > 7}">
						
							<c:set var="maxNo" value="${userList.size()+6}" />
							
							<c:forEach var="x" begin="1" end="${maxNo /7}">
								<a href="#" onclick="pageMove(this.id)" id="${x}">${x}</a>
							</c:forEach>
							
						</c:if>

						<a href="#" onclick="pageMove(this.id)" id="다음">다음</a>
					</div>

				</div>

			</c:if>
	</c:forEach>
</c:if>
	

</div>

<script type="text/javascript">
function selectLookup(selectValue) {
	alert(selectValue);

    if (selectValue == "rank") {
    	document.getElementById("search_option_rank").style.display = 'inline';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_text_box").style.display = 'none';
    }
    else if (selectValue == "joinDate" || selectValue == "lastAccess") {
    	document.getElementById("search_option_rank").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'inline';
    	document.getElementById("search_option_text_box").style.display = 'none';
    }
    else if (selectValue == "userId") {
    	document.getElementById("search_option_rank").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_text_box").style.display = 'inline';
    }
    

    
 }
 
// id에는 select의 id값, value에는 선택하고자 하는 option의 value 값을 파라미터로 입력한다.
function selectedOption(id, value) {
	var obj = document.getElementById(id);

	for (i=0 ; i<obj.length ; i++) {
	if(obj[i].value == value) {
	obj[i].selected = true;
	      }
	   }
	}
</script>