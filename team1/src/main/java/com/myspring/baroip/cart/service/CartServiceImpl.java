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
import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.product.vo.ProductVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductService productService;
	
	@Override
	public Map<String, Map<String, Map<String, Object>>> myCartList(CartVO cartVO) throws Exception{
		
		Map<String, Map<String, Map<String, Object>>> userCartListInfo = new HashMap<String, Map<String, Map<String, Object>>>();
		Map<String, Map<String, Object>> productList = new HashMap<String, Map<String, Object>>();
		List<CartVO> cartList = cartDAO.selectCartList(cartVO);
		
//		System.out.println("(CartService)cartVO.getUser_id : " + cartVO.getUser_id());

		for(int i=0; i<cartList.size(); i++) {
			String productId=cartList.get(i).getProduct_id();
//			System.out.println("cartService : " + productId);
			productList = productService.productDetail(productId);
//			System.out.println("(CartService)cartVO.getCart_count : " + cartVO.getCart_count());
//			System.out.println("(CartService)cartNum : " + cartNum);
			userCartListInfo.put("myCartList" + i, productList);
		}
		
		return userCartListInfo;
//		List<CartVO> cartList = cartDAO.selectCartList(cartVO);
//		String productId = new String();
//		for(int i=0; cartList.size() > i; i++) {
//			productId = ((CartVO) cartList.get(i)).getProduct_id();
////			System.out.println("cartService(cartList) : " + productId);
//		}
//		Map<String, Object> cartInfo = new HashMap<String, Object>();
//		cartInfo.put("cartVO", cartList);
//		Map<String, Map<String, Object>> cartProductInfo = productService.productDetail(productId);
//		cartProductInfo.put("cartInfo", cartInfo);
//		ProductVO product = (ProductVO)cartProductInfo.get("product");
//		System.out.println("cartService(cartList) : " + cartList);
//		return (Map<String, Object>) product;
	}

}
