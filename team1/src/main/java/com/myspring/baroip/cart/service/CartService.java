package com.myspring.baroip.cart.service;

import java.util.Map;

import com.myspring.baroip.cart.vo.CartVO;

public interface CartService {
	
//	장바구니 페이지
	public Map<String, Map<String, Map<String, Object>>> myCartList(CartVO cartVO) throws Exception;
	
//	장바구니 담기
	public void addProductInCart(CartVO cartVO) throws Exception;
	
}
