package com.myspring.baroip.adminProduct.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductDAO {
	public void insertProduct(ProductVO productVO) throws DataAccessException;
}
