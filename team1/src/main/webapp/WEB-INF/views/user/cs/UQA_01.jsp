<!--  2021.11.26 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 2022.01.07 윤상현 -->
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="8" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${noticeList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${noticeList}" />
<c:if test='${not empty pageNo}'>
	<script>
	
		window.addEventListener('load',function() {
			if(document.getElementById("${pageNo}")) {
			document.getElementById("${pageNo}").style.fontFamily = "kopub_bold";
			document.getElementById("${pageNo}").style.fontSize = "15px";
			}
		});


	</script>
</c:if>
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
					<input class="border" value="1:1문의 글쓰기" type="button" onclick="location.href='${contextPath}/cs/add_UQA_form.do'">
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
			<span>공개 여부</span>
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
		<c:when test="${itemList == null }">
			<div class="row">
				<div class="offset-lg-2 col-lg-8 text-center cs_01_listsection">
						<span>등록된 글이 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${itemList != null }">
	<!--  2022.01.07 윤상현   -->		
		<c:forEach var="i" begin="1" end="${itemSize}">
			<c:set var="desc" value="${itemSize - i + 1}" />		
			<c:set var="j" value="${(pageNoMax - pageNo * pageNoMax) + desc}" />
			<c:set var="key" value="notice${j}" />
			
			<c:if test="${not empty itemList[key].notice.notice_id && i< pageNoMax+1}">
				
				<div class="row">
					<div class="offset-lg-2 col-lg-1 text-left cs_02_listsection ">
						<span>${j}</span>
					</div>
					<div class="col-lg-1 text-left cs_02_listsection ">
						<span>${itemList[key].notice.user_id }</span>
					</div>
					<div class="col-lg-1 text-center cs_02_listsection ">
					<c:if test="${itemList[key].notice.notice_private == 0}">
						<span>비공개</span>
					</c:if>
					<c:if test="${itemList[key].notice.notice_private == 1}">
						<span>공개</span>
					</c:if>						
					</div>
					<div class="col-lg-3 text-center cs_02_listsection ">
						<p class="cs">
							<a id="cs_02_move" href="${contextPath}/cs/UQA_datail.do?notice_id=${itemList[key].notice.notice_id}">
								${itemList[key].notice.notice_title}
							</a>
						</p>
					</div>
					<div class="col-lg-2 text-center cs_02_listsection ">
						<span>${itemList[key].notice.notice_cre_date}</span>
					</div>
				</div>
				</c:if>
			</c:forEach>
			
		</c:when>
	</c:choose>

			<!--  2022.01.07 윤상현   -->
			<c:if test="${itemSize > pageNoMax}">

				<div class="row">

					<div class="col-lg-12 text-center admin_product_page_index">
						<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>
						<c:if test="${itemSize > pageNoMax}">
						
							<c:set var="maxNo" value="${itemSize+pageNoMax-1}" />
							
							<c:forEach var="x" begin="1" end="${maxNo / pageNoMax}">
								<fmt:parseNumber type="number" integerOnly="true" var="noFlag" value="${(pageNo+pageNoMax-1) / pageNoMax}" />
							
								<c:if test="${(noFlag * pageNoMax) - (pageNoMax-1) <= x and x <= (noFlag * pageNoMax)}">
									<a href="#" onclick="pageMove(this.id)" id="${x}">${x}</a>
								</c:if>
							</c:forEach>
							
						</c:if>

						<a href="#" onclick="pageMove(this.id)" id="다음">다음</a>
					</div>
					
				</div>

			</c:if>

</div>

<script>


/* 	let moveForm=$("#cs_02_moveForm");
	
	$("#cs_02_move").on("click", function(e) {
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='cs_02_notice_id' value='" + $(this).attr("href") + "'>'");
		moveForm.attr("action", "${contextPath}/cs/cs_02_02.do");
		moveForm.submit();
	}); */
	
	// 2022.01.07 윤상현  
	// 페이지 이동 스크립트
	function pageMove(no) {
		var getValue = 0;
		var lastPage = parseInt(${itemSize+pageNoMax-1} / ${pageNoMax});
		if(no == "이전" || no == "다음") {
			var uriValue = window.location.search;
			
			var array = uriValue.split("pageNo=");
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
			document.location='${contextPath}/cs/UQA_list.do?pageNo='+(--getValue);
			}
		}
		else if (no == "다음") {
			if(getValue == lastPage) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/cs/UQA_list.do?pageNo='+(++getValue);
			}
		}
		else {
			document.location='${contextPath}/cs/UQA_list.do?pageNo='+no;
		}
	}
	
</script>
