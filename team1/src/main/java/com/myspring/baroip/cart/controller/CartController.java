package com.myspring.baroip.cart.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.cart.vo.CartVO;



public interface CartController {

//	장바구니 페이지
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	장바구니 담기
	public CartVO addProductInCart(@RequestParam("cartVO") CartVO cartVO, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}