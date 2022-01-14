package com.myspring.baroip.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.user.dao.UserDAO;
import com.myspring.baroip.user.vo.UserVO;

@Service("UserService")
@Transactional(propagation=Propagation.REQUIRED)
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO login(Map  loginMap) throws Exception {
		return userDAO.login(loginMap);
	}
	
	@Override
	public String addUser(UserVO userVO) throws Exception {
		/* userDAO.insertNewUser(userVO); */
		return userDAO.insertNewUser(userVO);
	}
	
	@Override
	public String userIdOverlap(String id) throws Exception{
		return userDAO.selectIdOverlap(id);
	}
	
	@Override
//	비회원 주문시 아이디 생성
	public String guestJoin() throws Exception {
		return userDAO.insertGuestId();
	}

}
