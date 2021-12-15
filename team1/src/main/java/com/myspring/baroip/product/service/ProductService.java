package com.myspring.baroip.product.service;

import java.util.Map;

public interface ProductService {
	public Map<String, Map<String, Object>> bestProductList() throws Exception;
	public Map<String, Map<String, Object>> productDetail(String product_id) throws Exception;
}
