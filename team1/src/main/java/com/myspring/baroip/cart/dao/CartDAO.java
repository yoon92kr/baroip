package com.myspring.baroip.cart.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.user.vo.UserVO;

public interface CartDAO {
	public UserVO login(Map loginMap) throws DataAccessException;
}
