package com.myspring.baroip.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> selectBestProduct() throws DataAccessException {
		List<ProductVO> bestProductList = sqlSession.selectList("mapper.product.selectBestItem");


		return bestProductList;
     
	}

}
