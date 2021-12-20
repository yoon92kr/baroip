package com.myspring.baroip.product.service;


import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;
import com.myspring.baroip.product.dao.ProductDAO;
import com.myspring.baroip.product.vo.ProductVO;

@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ImageService imageService;

	// best product select
	@Override
	public Map<String, Map<String, Object>> bestProductList() throws Exception {

		// 베스트 상품 리스트 대입
		List<ProductVO> bestProducts = productDAO.selectBestProduct();
		
		
		// 메인화면에 호출할 세개의 상품정보 + 이미지를 담을 객체 생성 (mainProduct 1~3)
		Map<String, Map<String, Object>> bestProductInfo = new HashMap<String, Map<String, Object>>();
		// 이미지 호출을 위한 option Map 객체 생성
		Map<String, String> option = new HashMap<String, String>();
			
		if(bestProducts != null && !bestProducts.isEmpty() ) {
		for (int i = 0; i < bestProducts.size(); i++) {

			ProductVO product = bestProducts.get(i);
			
			if (product != null) {
				
				String match_id = product.getProduct_id();
				String image_category = "main";
				
				option.put("match_id", match_id);
				option.put("image_category", image_category);

				// 해당 상품과 연관된 메인 이미지 호출
				ImageVO productImage = imageService.selectProductImage(option);
				// byte를 img로 변환하기 위한 encode
				
				// 상품 내용과 이미지를 담을 객체 생성
				Map<String, Object> productInfo = new HashMap<String, Object>();
				
				// byte[] 자료를 img 태그에 사용가능하도록 encode
				String encodeImage = Base64.getEncoder().encodeToString(productImage.getImage_file());
				
				productInfo.put("product_main_title", product.getProduct_main_title());
				productInfo.put("product_sub_title", product.getProduct_sub_title());
				productInfo.put("product_price", product.getProduct_price());
				productInfo.put("product_discount", product.getProduct_discount());
				productInfo.put("image_file", encodeImage);
				productInfo.put("product_id", product.getProduct_id());

				bestProductInfo.put("product" + (i+1), productInfo);
				
			}

		}
		}

		return bestProductInfo;

	}
	
	// product detail 조회 service
	@Override
	public Map<String, Map<String, Object>> productDetail(String product_id) throws Exception {
		
		// 이미지정보 / 상품정보를 담을 객체 생성
		Map<String, Map<String, Object>> productInfo= new HashMap<String, Map<String, Object>>();
		// 이미지 정보를 불러올 option 객체 생성
		Map<String, String> option = new HashMap<String, String>();
			
		option.put("match_id", product_id);
		// jsp에서 sub이미지의 갯수만큼 반복문 사용을 위한 카운트 변수

		// 카테고리 정보를 담을 객체 생성 및 상품에 해당하는 이미지 카테고리 대입
		List<String> categoryList = imageService.selectImageCategory(product_id);
		Map<String, Object> item = new HashMap<String, Object>();
		List<String> imageList = new ArrayList<String>();
		for (int i = 0 ; i<categoryList.size() ; i++) {
			option.put("image_category", categoryList.get(i));
			ImageVO productImage = imageService.selectProductImage(option);
			
			String encodeImage = Base64.getEncoder().encodeToString(productImage.getImage_file());
			if (categoryList.get(i).contains("body")) {
				imageList.add(encodeImage);

			} else {
				item.put(categoryList.get(i), encodeImage);
				productInfo.put("image", item);
			}

		}
		
		item.put("body", imageList);
		productInfo.put("image", item);
		
		ProductVO product = productDAO.selectProduct(product_id);
		String body = product.getProduct_body().replaceAll("(\r\n|\r|\n|\n\r)", "&#10;");
		product.setProduct_body(body);
		
		item.put("productVO", product);
		// 상품 정보 대입
		productInfo.put("product", item);
		
		return productInfo;
			
	}
	
	@Override
	public Map<String, Map<String, Object>> selectProductList(String product_states) throws Exception {
		
		
				List<ProductVO> productList = productDAO.selectProductList(product_states);
				String encodeImage = "";
				
				Map<String, Map<String, Object>> selectProductList = new HashMap<String, Map<String, Object>>();
				// 이미지 호출을 위한 option Map 객체 생성
				Map<String, String> option = new HashMap<String, String>();
					
				if(productList != null && !productList.isEmpty() ) {
								
				for (int i = 0; i < productList.size(); i++) {

					ProductVO product = productList.get(i);
					
					if (product != null) {
						
						String match_id = product.getProduct_id();
						String image_category = "main";
						
						option.put("match_id", match_id);
						option.put("image_category", image_category);

						// 해당 상품과 연관된 메인 이미지 호출
						ImageVO productImage = imageService.selectProductImage(option);
						// byte를 img로 변환하기 위한 encode
						
						// 상품 내용과 이미지를 담을 객체 생성
						Map<String, Object> productInfo = new HashMap<String, Object>();
						
						// byte[] 자료를 img 태그에 사용가능하도록 encode
						if(productImage != null) {
						 encodeImage = Base64.getEncoder().encodeToString(productImage.getImage_file());
						}
						
						
						productInfo.put("product_main_title", product.getProduct_main_title());
						productInfo.put("product_cre_date", product.getProduct_cre_date());
						productInfo.put("product_amount", product.getProduct_amount());
						productInfo.put("product_states", product.getProduct_states());
						productInfo.put("image_file", encodeImage);
						productInfo.put("product_id", product.getProduct_id());
						productInfo.put("user_id", product.getUser_id());

						selectProductList.put("product" + (i+1), productInfo);
						
					}

				}
				}
				else {
					System.out.println("baroip : 임시등록된 상품이 없습니다.");
				}

				return selectProductList;
	}
}
