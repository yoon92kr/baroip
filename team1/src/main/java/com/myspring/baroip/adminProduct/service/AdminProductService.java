// 2021.12.09 윤상현

package com.myspring.baroip.adminProduct.service;

import java.util.Map;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductService {
	
	// 상품 등록 서비스
	public String addProduct(ProductVO productVO) throws Exception;
	
	// 상품 수량 변경 서비스
	public void updateAmount(Map<String, String> option) throws Exception;
	
	// 상품 삭제 서비스
	public void deleteProduct(String product_id) throws Exception;
	
	// 상품 수정 서비스
	public void updateProduct(ProductVO productVO) throws Exception;
	
	// 날짜를 기준으로 한 상품 조회 서비스
	public void search_date( Map<String, String> option) throws Exception;
}
