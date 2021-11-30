<!--  2021.11.25 강보석 -->

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
			<h3>자주 묻는 질문</h3>
		</div>
		<div class="offset-lg-3 col-lg-1 text-right cs_01_search-box">
			<form>
				<input class="search-box" type="text">
			</form>
		</div>
	</div>
		
	




	<div class="row">
		<div class="offset-lg-2 col-lg-8">
			<hr>
		</div>
	</div>


		<div class="row">

			<div class="offset-lg-2 col-lg-4 text-left cs_01_01header">
				<span>번호</span>
			</div>
			<div class="col-lg-4 text-left cs_01_01header">
				<span>제목</span>
			</div>

			<hr>
		</div>
		</div>
		
		
		
<div class="container-fluid">

	<div class="row">
		<div class="offset-lg-2 col-lg-3 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-5 text-center cs_01_listsection">
<div class="faq-content">
  <button class="question" id="que-1">
  <span>꺼내줘</span>
  <span id="que-1-toggle">∨</span></button>
  <div class="answer" id="ans-1">배그하고싶다</div>
</div>
				
				</div>
	</div>



	<div class="row">
		<div class="offset-lg-2 col-lg-3 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-5 text-center cs_01_listsection">
		<div class="faq-content">
  <button class="question" id="que-2">
  <span>술 마시고 싶다</span>
  <span id="que-2-toggle">∨</span></button>
  <div class="answer" id="ans-2">배그하고싶다</div>
</div>
</div>
		
		</div>
	<div class="row">
		<div class="offset-lg-2 col-lg-3 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-5 text-center cs_01_listsection">
		<div class="faq-content">
  <button class="question" id="que-3">
  <span>집에 가고 싶다</span>
  <span id="que-3-toggle">∨</span></button>
  <div class="answer" id="ans-3">배그하고싶다</div>
</div>
		</div>
	</div>
	
	


	<div class="row">
		<div class="offset-lg-2 col-lg-3 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-5 text-center cs_01_listsection">
		       <div class="faq-content">
  <button class="question" id="que-4">
  <span>도망쳐</span>
  <span id="que-4-toggle">∨</span></button>
  <div class="answer" id="ans-4">배그하고싶다</div>
</div>
		</div>
		</div>
		
		

	<div class="row">
		<div class="offset-lg-2 col-lg-3 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-5 text-center cs_01_listsection">
		       <div class="faq-content">
  <button class="question" id="que-5">
  <span>도망쳐</span>
  <span id="que-5-toggle">∨</span></button>
  <div class="answer" id="ans-5">배그하고싶다</div>
</div>
		</div>
		</div>
		
		<div class="row">
		<div class="offset-lg-2 col-lg-3 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-5 text-center cs_01_listsection">
		       <div class="faq-content">
  <button class="question" id="que-6">
  <span>도망쳐</span>
  <span id="que-6-toggle">∨</span></button>
  <div class="answer" id="ans-6">배그하고싶다</div>
</div>
		</div>
		</div>
		
		</div>
		
		
	 
    <div class="row">
     <div class="offset-lg-5 col-lg-1 text-center notice_01_line ">
     <p class="notice_01_next">
	        	<a href="#"> < 이전 </a> </div>
	        	 <div class="col-lg-1 text-center notice_01_line">
     <p class="notice_01_next">
	        	<a href="#">  다음 > </a>
	        	
	        </p> </div>
	        </div>
	















<script>
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '∨';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '∧';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
