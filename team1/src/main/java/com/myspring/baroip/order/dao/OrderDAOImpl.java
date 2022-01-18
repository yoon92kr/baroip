// 2022.01.14 À±»óÇö


package com.myspring.baroip.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectCount(CartVO cartVO) throws DataAccessException {
		int count = sqlSession.selectOne("mapper.order.cartCount", cartVO);
				
		return count;
	}
	
	@Override
	public void addOrder(OrderVO orderVO) throws DataAccessException {
		
		sqlSession.insert("mapper.order.addOrder", orderVO);
		

	}

}
