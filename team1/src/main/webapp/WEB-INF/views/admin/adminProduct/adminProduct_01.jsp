
<!-- 2021.12.02 한건희 -->
<!-- 2021.12.08 윤상현 -->
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
			<h1 class="page_title" id="test">관리자 페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">임시 상품 관리</span>
			</h6>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3 text-center adminUser_01-content-header">
			조회 유형 <select class="adminUser_01-select-box-lookup"
				onchange="Productchange(this.value)" id="search_option_category">
				<option value="productCreDate">상품 등록일</option>
				<option value="productTitle">상품 명</option>
			</select>
		</div>
		<div class="col-lg-6 text-center adminUser_01-content-header">
			<div id="adminProduct_01-productUpDate">
				<input id="adminProduct_01-productUpDate-begin" type="date">
				부터 <input id="adminProduct_01-productUpDate-end" type="date">
				까지
			</div>
			<div id="adminProduct_01-productUpDate_search">
				검색할 상품명 : <input id="adminProduct_01-productName-text" type="text">
			</div>

		</div>
		<div class="col-lg-3 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기" onclick="search_product_to_option()"> <input
				class="adminProduct_01-header-button adminProduct_01-button-top"
				type="button" value="상품 임시 등록"
				onclick="location.href='${contextPath}/admin/product/addProductForm.do'">
		</div>
	</div>

	<div class="row">
		<div
			class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">번호</h6>
		</div>
		<div
			class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">등록일</h6>
		</div>
		<div
			class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">담당자</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 이미지</h6>
		</div>
		<div
			class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 명</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상품 재고</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상태 변경</h6>
		</div>
	</div>
	<c:if test="${empty extraList}">
		<br>
		<div class="col-lg-12 text-center">임시 등록된 상품이 없습니다.</div>
	</c:if>
	<c:if test="${not empty extraList}">
		<c:forEach var="i" begin="1" end="${extraList.size() + 1}">
			<c:set var="j" value="${(pageNo*5 -5) + i}" />
			<c:set var="key" value="product${j}" />
			<c:if test="${not empty extraList[key].product_id && i<6}">


				<div class="row">
					<div class="col-lg-1 text-center order_01-content-item">${j}</div>
					<div class="col-lg-1 text-center order_01-content-item"
						style="padding: 33px 0px 0px 0px">${extraList[key].product_cre_date}
					</div>
					<div class="col-lg-1 text-center order_01-content-item">
						${extraList[key].user_id}</div>
					<div class="col-lg-2 text-center order_01-content-item-img">
						<a
							href="${contextPath}/product/productDetail.do?product_id=${extraList[key].product_id}">
							<img class="cart_image_clip"
							src="data:image/jpeg;base64,${extraList[key].image_file}"
							alt="상품 관리 페이지 상품 이미지">
						</a>
					</div>
					<div id="admin_product_title${j}"
						class="col-lg-3 text-center order_01-content-item">${extraList[key].product_main_title}
					</div>
					<div class="col-lg-2 order_01-content-item">
						<form name="itemCountBox" id="adminProduct_01-itemCountBox-detail">
							<div
								class="adminProduct_01-value-button adminProduct_01-decrease"
								id="amount_decrease${j}" onclick="decreaseValue(this.id)">-</div>
							<input type="number" class="adminProduct_product_amount_count"
								id="product_item_count${j}"
								value="${extraList[key].product_amount}"
								onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
							<div
								class="adminProduct_01-value-button adminProduct_01-increase"
								id="amount_increase${j}" onclick="increaseValue(this.id)">+</div>
							<input type="hidden" id="product_${j}"
								value="${extraList[key].product_id}"> <input
								type="hidden" id="user_id_${j}"
								value="${extraList[key].user_id}">
						</form>
						<input class="admin_01-itemCountBox-btn" id="${j}" type="button"
							value="변경" onclick="update_amount(this.id)">
					</div>
					<div class="col-lg-2 text-center adminProduct_01-content-item">
						<input class="adminProduct_01-product adminProduct_01-product-top"
							type="button" value="상품 수정" id="${j}"
							onclick="update_product_form(this.id)"> <input
							class="adminProduct_01-product" id="${j}" type="button"
							value="상품 삭제" onclick="delete_product(this.id)">
					</div>
				</div>
			</c:if>
			<c:if
				test="${empty extraList[key].product_id && i==extraList.size()+1 && extraList.size() > 5}">
				<div class="row">

					<div class="col-lg-12 text-center admin_product_page_index">
						<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>

						<c:if test="${extraList.size() > 5}">
							<c:set var="maxNo" value="${extraList.size()+4}" />
							<c:forEach var="x" begin="1" end="${maxNo /5}">
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
	function Productchange(selectValue) {

		if (selectValue == "productCreDate") {
			
			document.getElementById("adminProduct_01-productUpDate").style.display = 'inline';
			document.getElementById("adminProduct_01-productUpDate_search").style.display = 'none';
		} else if (selectValue == "productTitle") {
			document.getElementById("adminProduct_01-productUpDate").style.display = 'none';
			document.getElementById("adminProduct_01-productUpDate_search").style.display = 'inline';
		}
	}
	/*---------- 수량 증감 input 박스 설정 ----------*/

	/* 수량 증감 */
	function increaseValue(tagId) {
		let targetValue = '';
		for (i = 0; i < 10; i++) {
			if (String('amount_increase').concat(i) == String(tagId)) {
				targetValue = 'product_item_count'.concat(i);
			}

		}
		let countValue = parseInt(document.getElementById(targetValue).value,
				10);

		countValue = isNaN(countValue) ? 0 : countValue;
		countValue++;
		document.getElementById(targetValue).value = countValue;
	};

	function decreaseValue(tagId) {
		let targetValue = '';
		for (i = 0; i < 10; i++) {
			if (String('amount_decrease').concat(i) == String(tagId)) {
				targetValue = 'product_item_count'.concat(i);
			}

		}
		let countValue = parseInt(document.getElementById(targetValue).value,
				10);
		if (countValue <= 0) {
			alert("수량은 0보다 작을 수 없습니다.")
		}
		;
		countValue = isNaN(countValue) ? 0 : countValue;
		countValue < 1 ? countValue = 1 : '';
		countValue--;
		document.getElementById(targetValue).value = countValue;
	};
	/* 수량입력 후 엔터 입력시 이벤트 */

	function searchEvt(targetValue, targetId) {

		if (targetValue == "" || targetValue < 0) {
			alert('수량은 0보다 작을 수 없습니다.');
			document.getElementById(targetId).value = 0;
		}

	}

	/* 수량입력 후 다른 영역 클릭 시 이벤트 */
	/* window.addEventListener('load', eventPlus()); */
	window.onload = eventPlus();

	function eventPlus() {

		let target = document
				.querySelectorAll('.adminProduct_product_amount_count');

		for (i = 0; i < target.length; i++) {
			let item = target.item(i);
			item.onblur = eventGo;
		}

	}
	function eventGo() {
		if (this.value == "" || this.value < 0) {
			alert('수량은 0보다 작을 수 없습니다.');
			document.getElementById(this.id).value = 0;
		}

	}
	/* 상품 수량 수정 ajax */
	function update_amount(target) {
		let target_id = document.getElementById('product_'.concat(target)).value;
		let change_count_value = document.getElementById('product_item_count'
				.concat(target)).value;
		let target_title = document.getElementById('admin_product_title'.concat(target)).innerText;

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/product/update_amount.do",
			dataType : "text",
			data : {
				"product_id" : target_id,
				"product_amount" : change_count_value,
				"product_title" : target_title
			},
			success : function(message) {

				alert(message);

			},
			error : function() {
				alert("재고 수량 변경에 문제가 발생하였습니다.");
			}

		});
	}
	
	/* 상품 삭제 ajax */
	function delete_product(target) {
		
		let product_title = document.getElementById('admin_product_title'.concat(target)).innerText;
		let product_id = document.getElementById('product_'.concat(target)).value;
		var confirmFlag = confirm(product_title+"을(를) 정말 삭제하시겠습니까?")
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
	function update_product_form(target) {
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
	
	// 조회 필터 스크립트
	function search_product_to_option() {
		let searchOption = document.getElementById('search_option_category').value;
		let beginDate = document.getElementById('adminProduct_01-productUpDate-begin').value;
		let endDate = document.getElementById('adminProduct_01-productUpDate-end').value;
		let searchDate = beginDate.concat(',', endDate);
		let searchText = document.getElementById('adminProduct_01-productName-text').value;
		
		if (searchOption == "productCreDate") {
			if(endDate == "" || beginDate == "") {
				alert("정확한 조회 기간을 입력해주세요.");
			}
			else if(beginDate > endDate) {
				alert("조회 기준일이 종료일보다 클 수 없습니다.")
			}
			else {

				location.href='${contextPath}/admin/product/extra_list.do?search_option='+searchOption+'&search_value='+searchDate;

			}
			
		}
		else if (searchOption == "productTitle") {
			if (searchText.match(/\s/g)) {
				alert("검색어에 공백은 포함될 수 없습니다.")
			}
			else {
				location.href='${contextPath}/admin/product/extra_list.do?search_option='+searchOption+'&search_value='+searchText;
			}
		}
	}
	
	// 페이지 이동 스크립트
	function pageMove(no) {
		var getValue = 0;
		let beginDate = document.getElementById('adminProduct_01-productUpDate-begin').value;
		let endDate = document.getElementById('adminProduct_01-productUpDate-end').value;
		
		test = beginDate.concat(",", endDate);
		if(no == "이전" || no == "다음") {
			var uriValue = window.location.search;
			var array = uriValue.split("=");
			if(array[1] == "" || array[1] == null) {
				array[1] = 1;
			}
			getValue = array[1];
		}

		
		if(no == "이전") {
			document.location='${contextPath}/admin/product/extra_list.do?pageNo='+(--getValue);
		}
		else if (no == "다음") {
			document.location='${contextPath}/admin/product/extra_list.do?pageNo='+(++getValue);	
		}
		else {
			document.location='${contextPath}/admin/product/extra_list.do?pageNo='+no;
		}
	}
	
	// 검색조건 기존값 할당 스크립트
	window.addEventListener('load', function() {
	   if(${search_option != null && search_option != ""}) {
	    selectedOption("search_option_category", "${search_option}");

	    var main_option = document.getElementById("search_option_category").value;
	    Productchange(main_option);
	    
	    var begin = "";
	    var end = "";
	    if("${search_option}" == "productCreDate") {
	    	var splitDate = "${search_value}".split(",");
	    }
	    switch("${search_option}") {
	    case "productCreDate" :
	    	document.getElementById("adminProduct_01-productUpDate-begin").value = splitDate[0];
	    	document.getElementById("adminProduct_01-productUpDate-end").value = splitDate[1];
	       break;
	       
	    case "productTitle" :
	    	document.getElementById("adminProduct_01-productName-text").value = "${search_value}";
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