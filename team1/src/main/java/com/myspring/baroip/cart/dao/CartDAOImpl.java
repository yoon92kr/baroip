package com.myspring.baroip.cart.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.user.vo.UserVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO login(Map loginMap) throws DataAccessException{
		UserVO user=(UserVO)sqlSession.selectOne("mapper.user.login",loginMap);
	   return user;
	}

}
