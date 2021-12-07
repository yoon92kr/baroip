package com.myspring.baroip.cart.service;

import java.util.Map;

import com.myspring.baroip.user.vo.UserVO;

public interface CartService {
	public UserVO login(Map loginMap) throws Exception;

}
