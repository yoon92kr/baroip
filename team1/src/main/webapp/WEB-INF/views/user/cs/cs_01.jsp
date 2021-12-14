<!--  2021.11.25 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

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
		<div class="offset-lg-2 col-lg-1 text-left cs_01_01header">
			<span>번호</span>
		</div>
		<div class="col-lg-7 text-left cs_01_01header">
			<span>제목</span>
		</div>
		<hr>
	</div>

	<c:choose>
		<c:when test="${QAList == null }">
			<div class="row">
				<div class="offset-lg-2 col-lg-1 text-left cs_01_listsection">
						<span>등록된 글이 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${QAList != null }">
			<c:forEach var="QAList" items="${QAList }" begin="0" step="1" varStatus="QAListNum">
				<div class="row">
					<div class="offset-lg-2 col-lg-1 text-left cs_01_listsection">
						<span>${QAListNum.count }</span>
					</div>
					<div class="col-lg-7 text-center cs_01_listsection">
						<div class="faq-content">
							<button class="question" id="que-${QAListNum.index }">
								<span id="que-${QAListNum.index }-toggle" class="cs_01-que-tollge">∨</span> <span>${QAList.notice_title }</span>
							</button>
							<div class="answer" id="ans-${QAListNum.index }">${QAList.notice_body }</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>

	<div class="row">
		<div class="offset-lg-5 col-lg-1 text-center notice_01_line ">
			<p class="notice_01_next">
				<a href="#"> < 이전 </a>
		</div>
		<div class="col-lg-1 text-center notice_01_line">
			<p class="notice_01_next">
				<a href="#"> 다음 > </a>
			</p>
		</div>
	</div>

</div>


<script>
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');
    for(var i = 0; i < ${QAListSize}; i ++) {
    	    
	    if(document.getElementById(answerId).style.display === 'block') {
	      document.getElementById(answerId).style.display = 'none';
	      document.getElementById(this.id + i + '-toggle').textContent = '∨';
	    } else {
	      document.getElementById(answerId).style.display = 'block';
	      document.getElementById(this.id + i + '-toggle').textContent = '∧';
	    }
    
    }	
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>