package com.myspring.baroip.user.service;

import java.util.Map;

import com.myspring.baroip.user.vo.UserVO;

public interface UserService {
	public UserVO login(Map loginMap) throws Exception;
	
	public void addUser(UserVO userVO) throws Exception;
	
	public String userIdOverlap(String id) throws Exception;

}
