package com.myspring.baroip.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.cart.dao.CartDAO;
import com.myspring.baroip.cart.vo.CartVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;

	
	public List<CartVO> myCartList(CartVO cartVO) throws Exception{
		List<CartVO> cartList = cartDAO.selectCartList(cartVO);
		return cartList;
	}

}
