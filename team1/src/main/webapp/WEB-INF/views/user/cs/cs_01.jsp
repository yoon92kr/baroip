<!--  2021.11.25 강보석 -->
<!-- 2021.12.14 한건희 수정 -->

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
	
	<c:set var="page" value="${(param.p == null)? 1: param.p}" />
	<c:set var="startNum" value="${page-(page-1)%5}" />
	<c:set var="lastNum" value="23" />

		<div class="row">
			<div class="offset-lg-5 col-lg-2 text-center notice_01_line ">
				<span class="notice_01_next">
					<c:if test="${startNum > 1}">
						<a href="?p=${startNum-1}&t=&q=" >< 이전</a>				
					</c:if>
					<c:if test="${startNum <= 1}">
						<span onclick="alert('이전 페이지가 없습니다.');">< 이전</span>			
					</c:if>
				</span>
				<c:forEach var="i" begin="0" end="4">
					<a class="cs_01_page_Num" href="?p=${startNum+i}&t=${param.f}&q=${param.q}">${startNum+i}</a>
				</c:forEach>
				<span class="notice_01_next">
					<c:if test="${startNum + 5 < lastNum}">
						<a href="?p=${startNum+5}&t=&q=" >다음 ></a>
					</c:if>
					<c:if test="${startNum+5 >= lastNum}">
						<span onclick="alert('다음 페이지가 없습니다.');">다음 ></span>
					</c:if>
				</span>
			</div>
		</div>

</div>


<script>
/* 2021.12.14 한건희 수정 */
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