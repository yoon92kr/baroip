package com.myspring.baroip.cart.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



public interface CartController {

//	장바구니 페이지
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	장바구니 담기
	public String addProductInCart(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	상세페이지 동일 상품 추가
	public String cartInProductOverLap(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	장바구니 상품 삭제
	public String cartListDelete(@RequestParam("product_id") String product_id, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}