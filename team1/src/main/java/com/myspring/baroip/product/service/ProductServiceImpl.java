package com.myspring.baroip.product.service;

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
	public Map<String, Map<String, Object>> bestProductList() throws Exception {

		// 베스트 상품 리스트 대입
		List<ProductVO> bestProducts = productDAO.selectBestProduct();
		// 메인화면에 호출할 세개의 상품정보 + 이미지를 담을 객체 생성 (mainProduct 1~3)
		Map<String, Map<String, Object>> bestProductInfo = new HashMap<String, Map<String, Object>>();
		// 이미지 호출을 위한 option Map 객체 생성
		Map<String, String> option = new HashMap<String, String>();

		for (int i = 0; i < bestProducts.size(); i++) {

			ProductVO product = bestProducts.get(i);

			if (product != null) {

				String match_id = product.getProduct_id();
				String image_category = "main";


				option.put("match_id", match_id);
				option.put("image_category", image_category);

				// 해당 상품과 연관된 메인 이미지 호출
				ImageVO productImage = imageService.selectProductImage(option);


				// 상품 내용과 이미지를 담을 객체 생성
				Map<String, Object> productInfo = new HashMap<String, Object>();

				productInfo.put("product_main_title", product.getProduct_main_title());
				productInfo.put("product_sub_title", product.getProduct_sub_title());
				productInfo.put("product_price", product.getProduct_price());
				productInfo.put("product_discount", product.getProduct_discount());
				productInfo.put("image_file", productImage.getImage_file());

				bestProductInfo.put("mainProduct" + (i+1), productInfo);
				
			}
			// 아직 상품등록이 3개 미만일 경우를 대비한 else 문
			else {
				// 상품 내용과 이미지를 담을 객체 생성
				Map<String, Object> productInfo = new HashMap<String, Object>();

				productInfo.put("product_main_title", "상품명"+(i+1));
				productInfo.put("product_sub_title", "상품설명"+(i+1));
				productInfo.put("product_price", 10000);
				productInfo.put("product_discount", 0);
				productInfo.put("image_file", "");

				bestProductInfo.put("mainProduct" + (i+1), productInfo);
			}
		}

		return bestProductInfo;

	}
}
