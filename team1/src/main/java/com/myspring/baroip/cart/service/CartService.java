package com.myspring.baroip.cart.service;

import java.util.Map;

import com.myspring.baroip.cart.vo.CartVO;

public interface CartService {
	
//	장바구니 페이지
	public Map<String, Map<String, Map<String, Object>>> myCartList(CartVO cartVO) throws Exception;
	
//	장바구니 담기
	public void addProductInCart(CartVO cartVO) throws Exception;
	
//	해당 회원의 장바구니에 상품이 있는지 확인
	public boolean selectProductInCart(CartVO cartVO) throws Exception;
	
}
