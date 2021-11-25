<!-- 2021.11.24 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">장바구니</h1></div>
	</div>

<div class="cart_list_header">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_title"><input type="checkbox" id="cart_checkAll" onclick="checkAll();"></div>
		<div class="col-lg-5 text-center cart_title">상품정보</div>
		<div class="col-lg-1 text-center cart_title">수량</div>
		<div class="col-lg-1 text-center cart_title">가격</div>
		<div class="col-lg-1 text-center cart_total cart_total_1">총 상품금액</div>
		<div class="col-lg-1 text-center cart_total"><총상품금액></div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="#"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="#"><상품이름></a></div>
		<div class="col-lg-1 text-center cart_body">
		<form name="itemCountBox ">
  			<div class="value-button cart_body" id="cart_decrease" onclick="decreaseValue()" value="Decrease Value">-</div>
  			<input type="number" id="cart_item_count" value="1" />
  			<div class="value-button" id="cart_increase" onclick="increaseValue()" value="Increase Value">+</div>
		</form>
		</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1">총 배송비</div>
		<div class="col-lg-1 text-right cart_total_body"><배송비></div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="#"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="#"><상품이름></a></div>
		<div class="col-lg-1 text-center cart_body">수량</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1">총 할인액</div>
		<div class="col-lg-1 text-right cart_total_body"><상품할인금액></div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="#"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="#"><상품이름></a></div>
		<div class="col-lg-1 text-center cart_body">수량</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1 cart_total_bottom"></div>
		<div class="col-lg-1 text-right cart_total_body cart_total_bottom"><span class="maybe_cost_text">예상 결제 금액</span><br><span class="maybe_cost"><최종결제금액>원</span></div>
	
	</div>
	
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="#"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="#"><상품이름></a></div>
		<div class="col-lg-1 text-center cart_body">수량</div>
		<div class="col-lg-1 text-center cart_body"><상품가격></div>

	
	</div>
	
</div>

<div class="cart_list_bt">
	<div class="row">

		<div class="col-lg-2 offset-lg-8"><input type="button" value="전체 삭제"><input type="button" value="선택 삭제"></div>
	
	</div>
	
</div>

	<div class="row">

		<div class="col-lg-10 offset-lg-1 cart_list_bottom_hr"></div>

	</div>

<div class="cart_list_order_bt">
	<div class="row">

		<div class="col-lg-3 offset-lg-2"><a href="#"><img src="${contextPath}/resources/img/common/all_item_order.png"></a></div>
		<div class="col-lg-3"><a href="#"><img src="${contextPath}/resources/img/common/select_item_order.png"></a></div>
		<div class="col-lg-2"><a href="#"><img src="${contextPath}/resources/img/common/continue_shopping.png"></a></div>
	
	</div>
</div>

</div>

  <script>
  /* 체크박스 전체선택, 전체해제 */
  function checkAll(){
        if( $("#cart_checkAll").is(':checked') ){
          $("input[name=checkRow]").prop("checked", true);
        }else{
          $("input[name=checkRow]").prop("checked", false);
        }
  }
  
  /* 수량 증감 버튼 */
  function increaseValue() {
	  var value = parseInt(document.getElementById('cart_item_count').value, 10);

	  value = isNaN(value) ? 0 : value;
	  value++;
	  document.getElementById('cart_item_count').value = value;
	};

	function decreaseValue() {
	  var value = parseInt(document.getElementById('cart_item_count').value, 10);
	    if(value<=1){
	        alert("수량은 1보다 작을 수 없습니다.")
	    };
	  value = isNaN(value) ? 0 : value;
	  value < 2 ? value = 2 : '';
	  value--;
	  document.getElementById('cart_item_count').value = value;
	};
	 window.onload = eventPlus();

	             function eventPlus() {
	                  document.itemCountBox.cart_item_count.onblur = eventGo;
	             }
	              function eventGo() {
	                   if ( this.value == "" ) {
	                      alert( '수량을 입력해주세요.' );
	                       document.getElementById('cart_item_count').value = 1;       
	                   } 
	                  if (this.value <1) {


	                      alert("수량은 1보다 작을 수 없습니다.");
	                     document.getElementById('cart_item_count').value = 1;

	                   }

	              }
  </script>
