// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("adminOrderDAO")
public class AdminOrderDAOImpl implements AdminOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// 조회 조건에 따른 주문 리스트 조회 DAO
	@Override
	public List<Map<String, Object>> selectOrderToOption( Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> orderList = sqlSession.selectList("mapper.adminOrder.selectOrderToOption", option);

		return orderList;
	}
}
