package com.myspring.baroip.user.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.user.vo.UserVO;

public interface UserDAO {
	public UserVO login(Map loginMap) throws DataAccessException;
	
	public String insertNewUser(UserVO userVO) throws DataAccessException;
	
	public String selectIdOverlap(String id) throws DataAccessException;
	
//	비회원 주문시 아이디 생성
	public String insertGuestId() throws DataAccessException;

//	naver로그인 아이디 생성
	public void addNaverUser(UserVO userVO) throws DataAccessException;
}
