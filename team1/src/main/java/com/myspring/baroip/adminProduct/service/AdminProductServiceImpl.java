// 2021.12.09 À±»óÇö

package com.myspring.baroip.adminProduct.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.adminProduct.dao.AdminProductDAO;
import com.myspring.baroip.product.vo.ProductVO;

@Service("adminProductService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminProductServiceImpl implements AdminProductService {
	
	@Autowired
	private AdminProductDAO adminProductDAO;
	
	
	public String addProduct(ProductVO productVO) throws Exception {
		
		String product_id = adminProductDAO.insertProduct(productVO);
		
		return product_id;
	}
}
