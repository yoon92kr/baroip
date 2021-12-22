package com.myspring.baroip.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.cart.dao.CartDAO;
import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ImageService imageService;

	
	public List myCartList(CartVO cartVO) throws Exception{
		List cartList = cartDAO.selectCartList(cartVO);
		String productId = new String();
		for(int i=0; cartList.size() > i; i++) {
			productId = ((CartVO) cartList.get(i)).getProduct_id();
		}
		Map<String, String> imageProduct = new HashMap<String, String>();
		imageProduct.put("match_id", productId);
		imageProduct.put("image_category", "main");
		ImageVO cartImage = imageService.selectProductImage(imageProduct);
		String match_id = cartImage.getImage_match_id();
		String imageCategory = cartImage.getImage_category();
		if(match_id.equals(productId)) {
			match_id = productId;
		}
		cartList.add(match_id);
		cartList.add(imageCategory);
		return cartList;
	}

}
