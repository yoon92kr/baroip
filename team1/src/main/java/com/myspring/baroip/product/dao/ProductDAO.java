package com.myspring.baroip.product.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.product.vo.ProductVO;

public interface ProductDAO {
	
	public List<ProductVO> selectBestProduct() throws DataAccessException;
	public ProductVO selectProduct(String product_id) throws DataAccessException;
	public List<ProductVO> selectProductList(String product_states) throws DataAccessException;

}
