package com.myspring.baroip.cart.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.user.dao.UserDAO;
import com.myspring.baroip.user.vo.UserVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO login(Map  loginMap) throws Exception{
		return userDAO.login(loginMap);
	}

}
