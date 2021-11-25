<!--  2021.11.25 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".cs001>a").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
            $(this).next("ul").toggleClass("hide");
        });
    });
</script>





<div class="container-fluid">


    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">고객센터</h1></div>
    </div>
    
    
    <div class="row">
    <div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
    <h3>자주 묻는 질문</h3></div>
    </div>
    
    
   
      <div class="row">
        <div class="offset-lg-2 col-lg-8 offset-lg-1">
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

        <div class="offset-lg-2 col-lg-4 text-left cs_01_header" ><span>번호</span></div>
        <div class="col-lg-4 text-left cs_01_header"><span>제목</span></div>
        
        <hr>
        </div>
        </div>
        
        
        
        <div class="row">
        <div class="offset-lg-2 col-lg-4 text-left cs_01_section"><span>공지번호</span></div>
        <div class="col-lg-4 text-left cs_01_section">
        <p class="cs001">
        		<a>제목</a></div>
        		</div>
        		
        <div class="row">
        <div class="offset-lg-2 col-lg-4 text-left cs_01_section"><span>공지번호</span></div>
        <div class="col-lg-4 text-left cs_01_section">
        <p class="cs001">
        		<a>제목</a></div>
        		</div>
        		 <div class="row">
        <div class="offset-lg-2 col-lg-4 text-left cs_01_section"><span>공지번호</span></div>
        <div class="col-lg-4 text-left cs_01_section">
        <p class="cs001">
        		<a>제목</a></div>
        		</div>
        		
         <div class="row">
        <div class="offset-lg-2 col-lg-4 text-left cs_01_section"><span>공지번호</span></div>
        <div class="col-lg-4 text-left cs_01_section">
        <p class="cs001">
        		<a>제목</a></div>
        		</div>
        
         <div class="row">
       <div class="offset-lg-2 col-lg-4 text-left cs_01_section"><span>공지번호</span></div>
        <div class="col-lg-4 text-left cs_01_section">
        <p class="cs001">
        		<a>제목</a>
        		</p>
        		<ul class="hide">
        		<li>메뉴2-1</li>
        		<li>메뉴4-1</li>
        		<li>메뉴1-1</li>
        		<li>메뉴3-1</li>
                </ul>
        		
        		</div>
        		</div>
        		</div>
        		
     
				
        
      
        
        
  
        
        
        
        
        
        
        
        
   