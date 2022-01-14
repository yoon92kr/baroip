<!-- 2021.11.25 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container-fluid">

	<div class="row">
		<div class="col-lg-6 offset-lg-3 text-center">
			<h1 class="page_title">회원가입</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-center">
			<h4 class="join-sub-title">
				01. 약관동의 > <span class="join_01-sub-title">02. 정보입력</span>
			</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-8 offset-lg-2">
			<div class="join_02-top">가입정보 입력</div>
		</div>
	</div>
	
	<form action="${contextPath}/user/addUser.do" name="joinNewUser" method="post">
		
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				아이디
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_user_new_id" class="join_02-text-box" type="text" 
					name="user_id">
				<input id="join_02_user_id" type="hidden" name="user_id">
				<input id="join_02_user_id_overlap_btn" class="join_02-submit-box" 
					type="button" name="idOverLapCheck" value="중복 확인" onClick="idOverlap();">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				비밀번호
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_password" class="join_02-text-box"
					type="password" name="user_pw"> 
				<span class="join_02_pass_info">
					※ 비밀번호는 영문(소) / 숫자 / 특수문자가 포함되어야 합니다.
				</span>
			</div>
		</div>
		<!-- input창 password에 id = 나중에 비밀번호 유효성 검사 위해 넣어놓음 -->
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				비밀번호 확인
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_passowrd_check" class="join_02-text-box"
					type="password">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				이 름
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text" name="user_name">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				이메일
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="email" name="user_email">
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				이메일 인증
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text"> 
				<input class="join_02-submit-box" type="button" value="이메일 인증 번호">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				생년월일
			</div>
			<div class="col-lg-7 join_02-main-right">
				<!-- <select class="join_02-year-month-day" id="select_year"
				name="user_birth_yaer" onchange="javascript:lastday();">
				</select> -->
				<select id="select_year" class="join_02-year-month-day"
					name="user_birth_year">
					<c:forEach var="year" begin="1" end="50">
						<c:choose>
							<c:when test="${year==50}">
								<option value="${1971+year}" selected>${1971+year}</option>
							</c:when>
							<c:otherwise>
								<option value="${1971+year}">${1971+year}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<span class="join_02-year-month-day-text">년</span>

				<!-- <select class="join_02-year-month-day" id="select_month"
				name="user_birth_month" onchange="javascript:lastday();">
				</select> -->

				<select id="select_month" class="join_02-year-month-day"
					name="user_birth_month">
					<c:forEach var="month" begin="1" end="12">
						<c:choose>
							<c:when test="${month== 1}">
								<option value="${month}" selected>${month}</option>
							</c:when>
							<c:otherwise>
								<option value="${month}">${month}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<span class="join_02-year-month-day-text">월</span>
				 
				<select id="select_day" class="join_02-year-month-day"
					name="user_birth_day">
					<c:forEach var="day" begin="1" end="31">
						<c:choose>
							<c:when test="${day== 1}">
								<option value="${day}" selected>${day}</option>
							</c:when>
							<c:otherwise>
								<option value="${day}">${day}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<span class="join_02-year-month-day-text">일</span>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				핸드폰 번호
			</div>
			<div class="col-lg-7 join_02-main-right">
				<!-- 핸드폰 앞 번호 -->
				<select class="join_02-mobile" name="user_mobile_1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> -
				<!-- 핸드폰 중간 번호 -->
				<input id="join_02_mobile_center" class="join_02-mobile-02"
					type="number" name="user_mobile_2"
					oninput="join_02_mobile_number(this, 4)"> -
				<!-- 핸드폰 끝 번호 -->
				<input id="join_02_mobile_last" class="join_02-mobile-02"
					type="number" name="user_mobile_3"
					oninput="join_02_mobile_number(this, 4)">
				<!-- 인증번호 전송 버튼 -->
				<input class="join_02-submit-box-02" type="button" value="인증번호 전송"
					onclick="numberCheck(this);">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				인증 번호
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text"> 
				<input class="join_02-submit-box" type="button" value="인증번호 확인">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				주 소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="user_post_code" class="join_02-text-box" type="text"
					name="user_post_code"> 
				<input id="user_post_code" class="join_02-submit-box" type="button" value="우편번호 검색"
					name="user_post_code" onclick="javascript:execDaumPostcode()">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				지번 주소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text" id="user_old_address"
					name="user_old_address">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				도로명 주소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text" id="user_new_address"
					name="user_new_address">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				상세 주소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="user_detail_address" class="join_02-text-box" type="text"
					name="user_detail_address">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4 offset-lg-2 join_02-bottom-btn">
				<div class="join_01-btn">
					<a class="join_01-back" href="${contextPath}/user/join_01.do">
						<img class="bottom_btn_size"
						src="${contextPath}/resources/img/common/back_page_btn.png"
						alt="회원가입 정보입력 이전페이지 버튼 이미지">
					</a>
				</div>
			</div>
			<div class="col-lg-4 join_02-bottom-btn">
				<div class="join_01-btn">
					<input class="bottom_btn_size" type="image"
						src="${contextPath}/resources/img/common/join_btn.png"
						alt="회원가입 정보입력 가입하기 버튼 이미지">
				</div>
			</div>
		</div>
	</form>

</div>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	/* 각 값들을 확인하는 함수 */
	function checkAll() {
	}
	
	/* 각 입력란에 공백 확인 하는 함수 */
	function checkSpace(value, dataName) {
		if(value == "") {
			alert(dataName + " 입력해주세요.");
			return false;
		}
		return true;
	}
	
	function checkUserId() {
		/* id 입력 확인 */
		if(!checkSpace(id, "아이디를"))
			return false;
		
		/* 아이디 유효성 검사 */
		let idRegExp = /^[a-zA-z0-9]{4,12}$/; 
		if(!idRegExp.test(id)) {
			alert("아이디는 영문 대소문자와 숫자 4 ~ 12 자리로 입력해야합니다.");
			document.joinNewUser.user_id.value = "";
			document.joinNewUser.user_id.focus();
			return false;
		}
		/* 확인 완료 시 */
		return true;
	}

	function idOverlap() {
	    let _id=$("#join_02_user_new_id").val();
	    /* 특수문자 확인 */
	    let spe = _id.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
	    if(_id==''){
	   	 alert("ID를 입력하세요");
	    } else if((_id.length < 6) || (_id.length > 20)) {
	    	alert("아이디를 6자리 ~ 20자리 이내로 입력해주세요.");
	    	return false;
	    } else if(_id.search(/\s/) != -1) {
	    	alert("아이디는 공백없이 입력해주세요.");
	        return false;
	    } else if (spe > 0 || korean > 0) {
	        alert("아이디는 영문,숫자만 입력해주세요.");
	        return false;
	    } else {
	    	
			$.ajax({
			type:"post",
			async:false,  
			url:"${contextPath}/user/userIdOverlap.do",
			dataType:"text",
			data: {id:_id},
			success:function (data,textStatus){
				if(data=='false'){
					alert("사용 가능한 아이디 입니다.");
					$('#join_02_user_id_overlap_btn').prop("disabled", true);
					$('#join_02_user_new_id').prop("disabled", true);
					$('#join_02_user_id').val(_id);
				}else{
					alert("사용할 수 없는 ID입니다.");
				}
	       },
			error:function(data,textStatus){
				alert("페이지 에러.");
			});  //end ajax	 
	    }
	 }

	/* 핸드폰 중간 및 마지막 번호 text 4자리로 제한 */
	function join_02_mobile_number(el, maxlength) {
		if (el.value.length > maxlength) {
			el.value = el.value.substr(0, maxlength);
		}
	}

	function mobileFirst() {
		var mobileFirstNumber = document.getElementByName("user_mobile_1");
		mobileFirstNumber.options[target.selectedIndex].value;
	}

	/* 핸드폰 번호 확인 이벤트 */
	function numberCheck(center, last) {
		let join_02_mobile_center = document
				.getElementById('join_02_mobile_center').value
		let join_02_mobile_last = document
				.getElementById('join_02_mobile_last').value

		if (join_02_mobile_center.length < 3) {
			alert('핸드폰 번호를 확인해 주세요');
		} else if (join_02_mobile_last.length != 4) {
			alert('핸드폰 번호를 확인해 주세요');
		}
	}

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('user_post_code').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('user_new_address').value = fullRoadAddr;
						document.getElementById('user_old_address').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}

					}
				}).open();
	}
</script>

