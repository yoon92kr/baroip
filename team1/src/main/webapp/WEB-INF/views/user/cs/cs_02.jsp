<!--  2021.11.26 강보석 -->

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
		<div class="col-lg-4 text-right cs_02_writebtn">
			<a href="${contextPath}/cs/cs_02_01.do">
				<img src="${contextPath}/resources/img/common/cs_write.png"
					alt="1:1문의 글쓰기 버튼 이미지">
			</a>
		</div>
	</div>
	
	<div class="row">
		<div class="offset-lg-2 col-lg-1 text-left cs_01_01header">
			<span>번호</span>
		</div>
		<div class="col-lg-1 text-left cs_01_01header">
			<span>아이디</span>
		</div>
		<div class="col-lg-1 text-center cs_01_01header">
			<span>공개 상태</span>
		</div>
		<div class="col-lg-3 text-center cs_01_01header">
			<span>제목</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>작성일</span>
		</div>
		<hr>
	</div>
	
	<c:choose>
		<c:when test="${questList == null }">
			<div class="row">
				<div class="offset-lg-2 col-lg-8 text-center cs_01_listsection">
						<span>등록된 글이 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${questList != null }">
			<c:forEach var="questitem" items="${questList }" begin="0" step="1" varStatus="questItemNum">
				<div class="row">
					<div class="offset-lg-2 col-lg-1 text-left cs_02_listsection ">
						<span>${questItemNum.count }</span>
					</div>
					<div class="col-lg-1 text-left cs_02_listsection ">
						<span>${questitem.user_id }</span>
					</div>
					<div class="col-lg-1 text-center cs_02_listsection ">
						<span>${questitem.notice_private}</span>
					</div>
					<div class="col-lg-3 text-center cs_02_listsection ">
						<p class="cs">
							<a id="cs_02_move" href="${contextPath}/cs/quest_datail.do?notice_id=${questitem.notice_id}">
								${questitem.notice_title}
							</a>
						</p>
					</div>
					<div class="col-lg-2 text-center cs_02_listsection ">
						<span>${questitem.notice_cre_date}</span>
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
	<form id="cs_02_moveForm" method="get">
	</form>
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


	let moveForm=$("#cs_02_moveForm");
	
	$("#cs_02_move").on("click", function(e) {
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='cs_02_notice_id' value='" + $(this).attr("href") + "'>'");
		moveForm.attr("action", "${contextPath}/cs/cs_02_02.do");
		moveForm.submit();
	});
</script>
