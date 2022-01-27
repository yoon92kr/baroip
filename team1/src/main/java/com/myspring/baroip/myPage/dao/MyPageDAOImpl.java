// 2022.01.24 윤상현

package com.myspring.baroip.myPage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.user.vo.UserVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// user_id 에 해당하는 cart의 전체 수량 select DAO
	@Override
	public int myPageCartCount(UserVO userVO) throws DataAccessException {
		int cartCount = sqlSession.selectOne("mapper.myPage.myPageCartCount", userVO);
				
		return cartCount;
	}
	
	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select DAO
	@Override
	public int myPageOrderCount(UserVO userVO) throws DataAccessException {
		int orderCount = sqlSession.selectOne("mapper.myPage.myPageOrderCount", userVO);
				
		return orderCount;
	}
	
	@Override
	public int updateMyInfo(UserVO userVO) throws DataAccessException{
		
		int flag = sqlSession.update("mapper.myPage.updateMyInfo", userVO);
		
		return flag;
	}

}
