package com.myspring.baroip.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cart.vo.CartVO;

public interface CartDAO {
	
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
}
