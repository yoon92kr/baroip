<!-- 2021.11.30 한건희 -->
<!-- 2021.12.28 윤상현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				onchange="selectLookup(this.value)" id="search_option_category">
				<option value="all">전체 회원</option>
				<option value="rank">회원 등급</option>
				<option value="joinDate">가입일</option>
				<option value="lastAccess">최종 접속일</option>
				<option value="userId">아이디</option>
			</select>
		</div>

		<div class="col-lg-6 text-center adminUser_01-content-header">

			<select id="search_option_rank"
				class="adminUser_01-select-box-lookup">
				<option value="guest">비회원</option>
				<option value="user">회원</option>
				<option value="admin">관리자</option>
			</select>

			<div id="search_option_date">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>
			<div id="search_option_text_box">
				검색할 키워드 : <input id="search_option_text"
					class="adminUser_01-select-box-lookup" type="text">
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
		<c:forEach var="i"  begin="1" end="${userList.size()}">
			<c:set var="j" value="${(pageNo*7 - 7) + i -1}" />
			<c:if test="${not empty userList[j] && i <8}">

				<div class="row">
					<div class="col-lg-2 text-center adminUser_user_list_form">
						<div>${userList[j].user_id}</div>

					</div>

					<c:if test="${userInfo.user_rank == 4 }">

						<div class="col-lg-2 text-center adminUser_user_list_form_rank">
							<select class="product_states_select"
								id="product_state_${j+1}">

								<option value="0"
									<c:if test='${userList[j].user_rank == "0"}'>selected</c:if>>비회원</option>
								<option value="1"
									<c:if test='${userList[j].user_rank == "1"}'>selected</c:if>>회원</option>
								<option value="2"
									<c:if test='${userList[j].user_rank == "2"}'>selected</c:if>>일반
									관리자</option>
								<option value="3"
									<c:if test='${userList[j].user_rank == "3"}'>selected</c:if>>상품
									관리자</option>
								<option value="4"
									<c:if test='${userList[j].user_rank == "4"}'>selected</c:if>>총
									책임자</option>
							</select> <input class="admin_01-itemCountBox-btn" id="${j+1}"
								type="button" value="변경" onclick="update_states(this.id)">
						</div>
					</c:if>
					<c:if test="${userInfo.user_rank < 4 }">
						<div class="col-lg-2 text-center adminUser_user_list_form">
							<c:if test='${userList[j].user_rank == "0"}'>비회원</c:if>
							<c:if test='${userList[j].user_rank == "1"}'>회원</c:if>
							<c:if test='${userList[j].user_rank == "2"}'>일반 관리자</c:if>
							<c:if test='${userList[j].user_rank == "3"}'>전체 관리자</c:if>
							<c:if test='${userList[j].user_rank == "4"}'>총 책임자</c:if>

						</div>
					</c:if>



					<div class="col-lg-2 text-center adminUser_user_list_form">
						<fmt:formatNumber value="${userList[j].user_total_amount}" />
						원
					</div>
					<div class="col-lg-2 text-center adminUser_user_list_form">${userList[j].user_join_date}</div>
					<div class="col-lg-2 text-center adminUser_user_list_form">${userList[j].user_last_date}</div>
					<div class="col-lg-2 text-center adminUser_user_list_form_edit">
						<input
							class="adminProduct_01-product adminProduct_01-product-top "
							type="button" value="회원 수정" id="${j+1}"
							onclick="update_product_form(this.id)"> <input
							class="adminProduct_01-product" id="${j+1}"
							type="button" value="회원 삭제" onclick="delete_product(this.id)">

					</div>
				</div>
			</c:if>
			<c:if
				test="${j > 6 && j+1 == userList.size()}">

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

    if (selectValue == "rank") {
    	document.getElementById("search_option_rank").style.display = 'inline';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_text_box").style.display = 'none';
    }
    else if (selectValue == "all") {
    	document.getElementById("search_option_rank").style.display = 'none';
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
/* 회원 삭제 ajax */
function delete_user(target) {
	
	let product_title = document.getElementById('admin_product_title'.concat(target)).innerText;
	let product_id = document.getElementById('product_'.concat(target)).value;
	var confirmFlag = confirm(product_title+"을(를) 정말 삭제하시겠습니까?");
	if(confirmFlag){
		
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/product/delete_product.do",
			dataType : "text",
			data : {
				"product_id" : product_id			
			},
			success : function(message) {
				alert(product_title+" 상품이 정상적으로 삭제되었습니다.");
		 		location.reload();
			},
			error : function() {
				alert("해당 상품 삭제에 문제가 발생하였습니다.");
			}

		});
	}
		


}

/* 상품 수정 ajax */
function update_user_form(target) {
	let user_id = document.getElementById('user_id_'.concat(target)).value;
	let target_id = document.getElementById('product_'.concat(target)).value;
	window.sStorage = window.sessionStorage;
	
	if(${userInfo.user_rank > 2} || "${userInfo.user_id}" == user_id) {

		location.href='${contextPath}/admin/product/update_product_form.do?product_id='+target_id;
		
	}
	
	else {
		alert("해당 상품을 수정할 권한이 없습니다.");
	}
}
/* 회원 권한 수정 ajax */
function update_states(target) {

	if(${userInfo.user_rank == "4"}) {
		let target_id = document.getElementById('product_'.concat(target)).value;
		let new_state = document.getElementById('product_state_'.concat(target)).value;
		let old_state = document.getElementById('states_'.concat(target)).value;
		let product_title = document.getElementById('admin_product_title'.concat(target)).innerText;
		
		if(new_state == old_state) {
			alert("기존의 상품 상태와 변경하고자 하는 상품 상태가 동일합니다.");
		}
		
		else {
			var confirmFlag = confirm(product_title+"의 상품 상태를 수정하시겠습니까?");
			
			if(confirmFlag){
				
				$.ajax({
					async : false,
					url : "${contextPath}/admin/product/update_state.do",
					dataType : "text",
					data : {
						"product_id" : target_id,
						"product_states" : new_state,
						"product_title" : product_title
					},
					success : function(message) {
						alert(message);
					},
					error : function() {
						alert("권한 수정에 문제가 발생하였습니다.");
					}

				});
			}
		}
	}
	
	else {
		alert("잘못된 접근입니다.");
	}
	
}
// 조회 필터 스크립트
function search_user_to_option() {
	let searchOption = document.getElementById('search_option_category').value;
	let beginDate = document.getElementById('search_option_date_begin').value;
	let endDate = document.getElementById('search_option_date_end').value;
	let searchDate = beginDate.concat(',', endDate);
	let searchText = document.getElementById('search_option_text').value;
	let searchRank = document.getElementById('search_option_rank').value;
	
	// 날짜 기준 조회
	if (searchOption == "joinDate" || searchOption == "lastAccess") {
		if(endDate == "" || beginDate == "") {
			alert("정확한 조회 기간을 입력해주세요.");
		}
		else if(beginDate > endDate) {
			alert("조회 기준일이 종료일보다 클 수 없습니다.")
		}
		else {
			location.href='${contextPath}/admin/user/user_list.do?search_option='+searchOption+'&search_value='+searchDate;

		}
		
	}
	// 포함된 아이디 기준 조회
	else if (searchOption == "userId") {
		if (searchText.match(/\s/g)) {
			alert("검색어에 공백은 포함될 수 없습니다.")
		}
		else {
			location.href='${contextPath}/admin/user/user_list.do?search_option='+searchOption+'&search_value='+searchText;
		}
	}
	
	// 회원 등급 기준 조회
	else if (searchOption == "rank") {
			location.href='${contextPath}/admin/user/user_list.do?search_option=rank&search_value='+searchRank;
	}

	// 전체 회원 조회
	else if (searchOption == "all") {
		location.href='${contextPath}/admin/user/user_list.do';
	}
	
}

// 페이지 이동 스크립트
function pageMove(no) {
	var getValue = 0;
	var lastPage = parseInt(${userList.size()+6} / 7);
	if(no == "이전" || no == "다음") {
		var uriValue = window.location.search;
		var array = uriValue.split("=");
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
		document.location='${contextPath}/admin/user/user_list.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/admin/user/user_list.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/admin/user/user_list.do?pageNo='+no;
	}
}

// 검색조건 기존값 할당 스크립트
window.addEventListener('load', function() {
   if(${search_option != null && search_option != ""}) {
    selectedOption("search_option_category", "${search_option}");

    var main_option = document.getElementById("search_option_category").value;
    selectLookup(main_option);
    
    var begin = "";
    var end = "";
    if("${search_option}" == "joinDate" || "${search_option}" == "lastAccess") {
    	var splitDate = "${search_value}".split(",");
    }
    
    switch("${search_option}") {
    case "joinDate" :
    	document.getElementById("search_option_date_begin").value = splitDate[0];
    	document.getElementById("search_option_date_end").value = splitDate[1];
       break;
    
    case "lastAccess" :
    	document.getElementById("search_option_date_begin").value = splitDate[0];
    	document.getElementById("search_option_date_end").value = splitDate[1];
       break;
       
    case "userId" :
    	document.getElementById("search_option_text").value = "${search_value}";
       break;
       
    case "rank" :
    	selectedOption("search_option_rank", "${search_value}");
	   break;
    }
    
   }

});

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