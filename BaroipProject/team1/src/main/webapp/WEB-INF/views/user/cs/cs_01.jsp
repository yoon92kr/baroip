<!--  2021.11.25 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script> <script> $(document).ready(function()
		{ $("#spreadBtn02").click(function(){ if($("#hiddenList01").
				is(":visible"))
		{ $("#hiddenList01").slideUp(); }
		else{ $("#hiddenList01").slideDown(); } }); }); </script>



<div class="container-fluid">


	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>자주 묻는 질문</h3>
		</div>
	</div>



	<div class="row">
		<div class="offset-lg-2 col-lg-8">
			<hr>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-9 col-lg-1 text-left cs_01_search-box">
			<form>
				<input class="search-box" type="text">
			</form>
		</div>
	</div>

	<div class="container-fluid">

		<div class="row">

			<div class="offset-lg-2 col-lg-4 text-left cs_01_header">
				<span>번호</span>
			</div>
			<div class="col-lg-4 text-left cs_01_header">
				<span>제목</span>
			</div>

			<hr>
		</div>
	</div>



	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_section">
			<span>공지번호</span>
		</div>
		<div class="col-lg-4 text-left cs_01_section">

				<a>제목</a>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_section">
			<span>공지번호</span>
		</div>
		<div class="col-lg-4 text-left cs_01_section">
		
		</div>
	</div>
	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_section">
			<span>공지번호</span>
		</div>
		<div class="col-lg-4 text-left cs_01_section">
		
		</div>
	</div>
	
	
	
	
	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_section">
			<span>공지번호</span>
		</div>
		<div class="col-lg-4 text-left cs_01_section">
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_section">
			<span>공지번호</span>
		</div>
		<div class="col-lg-4 text-left cs_01_section">
			
		</div>
	</div>
	

	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_section">
			<span>공지번호</span>
		</div>
		<div class="col-lg-4 text-left">
		<button id="spreadBtn02" class="btn01">펼치기</button>
		 <ul id="hiddenList01" class="example01" style="display: none;">
		 <li>공간좀</li> 
		 <li>펼쳐져라</li>
		 <li>제발 ㅠ</li>
		  </ul>

			
		</div>

		</div>
	</div>













