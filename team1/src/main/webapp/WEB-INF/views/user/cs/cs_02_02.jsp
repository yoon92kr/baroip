<!--  2021.11.26 강보석 -->
<!-- 2021.12.15 한건희 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>1:1 문의</h3>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-8 cs_02_02_row">
			<hr>
		</div>
	</div>


	<form id="questUpdate" action="${contextPath}/cs/questUpdate.do"
	name="questContent" method="get">

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span> <input type="hidden" name="notice_id"
				value="${questInfo.notice_id}">
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<input class="cs_02_02_text_box1" type="text" name="notice_title"
				value="${questInfo.notice_title}" readonly>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>문의유형</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<input class="cs_02_02_text_box1" type="text" name="notice_type"
				value="${questInfo.notice_type}" readonly>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>작성자 아이디</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<input class="cs_02_02_text_box1" type="text" name="user_id"
				value="${questInfo.user_id}" readonly>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<textarea class="cs_02_02_quest_content" name="notice_body" readonly>${questInfo.notice_body}</textarea>
		</div>
	</div>
	


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center">
			<div class="notice_back_btn">
				<input type="button" id="cs_02_02_update_btn" value="수정하기">
			</div>
		</div>
		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<input type="button" id="cs_02_02_list_btn" value="목록">
			</div>
		</div>
		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
			<input type="button" id="cs_02_02_delete_btn" value="삭제">
		</div>
	</div>

	</form>

	<form id="infoForm" action="${contextPath}/cs/questUpdate" method="get">
		<input type="hidden" id="cs_02_02_NI" name="notice_id"
			value="${questInfo.notice_id}">
	</form>
</div>

<script>

	let uform = $("#questUpdate");
	let form = $("#infoForm");
	let dform = $("#deleteForm");
	
	// 목록 이동 버튼
	$("#cs_02_02_list_btn").on("click", function(e) {
		form.find("#cs_02_02_NI").remove();
		form.attr("action", "${contextPath}/cs/inquiry_list.do");
		form.submit();
	});
	
	
	
	// 수정하기 버튼
	$("#cs_02_02_update_btn").on("click", function(e) {
		uform.attr("action", "${contextPath}/cs/questUpdate.do");
		uform.submit();
	});
	
	
	
	// 삭제 버튼
	$("#cs_02_02_delete_btn").on("click", function(e) {
		dform.attr("action", "${contextPath}/cs/questDelete.do");
		dform.submit();
	});
	
	
</script>
