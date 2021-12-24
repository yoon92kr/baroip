<!--  2021.11.24 강보석 -->
<!-- 2021.12.24 임석희 수정 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />







<div class="container-fluid">


    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">공지사항</h1></div>
    </div>

      <div class="row">
        <div class="offset-lg-1 col-lg-10 offset-lg-1">
        <hr>
        </div>
        </div>
   
          
          <div class="row">

        <div class="offset-lg-1 col-lg-2 text-center notice_01_header" ><span>번호</span></div>
        <div class="col-lg-1 text-left notice_01_header"><span>작성자</span></div>
        <div class="col-lg-4 text-center notice_01_header"><span>제목</span></div>
        <div class="col-lg-3 text-center notice_01_header"><span>작성일자</span></div>
        <hr>
        </div>





          <c:choose>
		<c:when test="${NTList == null }">
			<div class="row">
				<div class="offset-lg-2 col-lg-8 text-center cs_01_listsection">
						<span>등록된 글이 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${NTList != null }">
			<c:forEach var="NTitem" items="${NTList }" begin="0" step="1" varStatus="NTItemNum">
				<div class="row">
					<div class="offset-lg-1 col-lg-2 text-center notice_01_section">
						<span>${NTItemNum.count }</span>
					</div>
					<div class="col-lg-1 text-left notice_01_section">
						<span>${NTitem.user_id }</span>
					</div>
					<div class="col-lg-4 text-center notice_01_section">
						<p class="notice">
							<a id="notice_02_move" href="${contextPath}/notice/notice_02.do?notice_id=${NTitem.notice_id}">
								${NTitem.notice_title}
							</a>
						</p>
					</div>
					<div class="col-lg-3 text-center notice_01_section ">
						<span>${NTitem.notice_cre_date}</span>
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
          
   
    <div class="row">
     <div class="offset-lg-5 col-lg-1 text-center notice_01_line ">
     <p class="notice_01_next">
	        	<a href="#"> < 이전 </a> </div>
	        	 <div class="col-lg-1 text-center notice_01_line">
     <p class="notice_01_next">
	        	<a href="#">  다음 > </a>
	        	
	        </p> </div>
	        </div>
	 </div>
	        