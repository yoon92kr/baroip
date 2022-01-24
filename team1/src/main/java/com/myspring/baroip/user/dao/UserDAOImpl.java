package com.myspring.baroip.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO login(Map loginMap) throws DataAccessException {
		UserVO user=(UserVO)sqlSession.selectOne("mapper.user.login",loginMap);
	   return user;
	}
	
	@Override
	public String insertNewUser(UserVO userVO) throws DataAccessException {
		sqlSession.insert("mapper.user.insertNewUser",userVO);
		String user_name = userVO.getUser_name();
		return user_name;
	}
	
	@Override
	public String selectIdOverlap(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.user.selectIdOverlap",id);
		return result;
	}
	
//	naver로그인 아이디 생성
	@Override
	public void addNaverUser(UserVO userVO) throws DataAccessException {
		sqlSession.insert("mapper.user.insertNaverUser", userVO);
	}
	
//	비회원 주문시 아이디 생성
	@Override
	public String insertGuestId() throws DataAccessException {
		String guestId;
		int result = sqlSession.insert("mapper.user.guestUser");
		if(result == 1) {
			guestId = sqlSession.selectOne("mapper.user.selectGuestId");
		}
		else {
			guestId = "";
		}
		return guestId;
	}
	
//	아이디 찾기
	@Override
	public String userIdFind(UserVO userVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.user.selectUserIdFind", userVO);
		return result;
	}

}
