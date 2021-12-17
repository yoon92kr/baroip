// 2021.12.09 À±»óÇö

package com.myspring.baroip.adminProduct.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductDAO {
	public String insertProduct(ProductVO productVO) throws DataAccessException;
	
	public void updateAmount(Map<String, String> option) throws DataAccessException;
	
	public void deleteProduct(String product_id) throws DataAccessException;
}
