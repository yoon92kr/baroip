package com.myspring.baroip.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cart.vo.CartVO;

public interface CartDAO {
	
//	장바구니 페이지
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
	
//	장바구니 담기
	public void insertProductInCart(CartVO cartVO) throws DataAccessException;
}
