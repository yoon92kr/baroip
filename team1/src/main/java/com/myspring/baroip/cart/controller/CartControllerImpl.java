package com.myspring.baroip.cart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.cart.service.CartService;
import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.user.vo.UserVO;


@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	
	
	// 장바구니 페이지
	@Override
	@RequestMapping(value= "/cartList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		String user_id = userVO.getUser_id();
		cartVO.setUser_id(user_id);
		Map<String, Map<String, Map<String, Object>>> userCartListInfo = cartService.myCartList(cartVO);
//		System.out.println("cartcontroller(userCartListInfo.user_id : " + userCartListInfo);
//		System.out.println("cartcontroller(userCartListInfo) : " + userCartListInfo.size());
//		System.out.println("cartController : " + userCartListInfo.get("myCartList0").get("product").get("productVO"));
//		System.out.println("cartController(cart_count) : " + userCartListInfo.get("myCartList1").get(cartVO.getCart_count()));
		mav.addObject("userCartListInfo", userCartListInfo);
		mav.setViewName(viewName);
		return mav;
		
	}
	
//	상품 상세 페이지 > 장바구니 담기 기능
	@Override
	@RequestMapping(value= "/addProductInCart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addProductInCart(@RequestParam("cartVO") CartVO cartVO, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		String user_id = userVO.getUser_id();
		cartVO.setUser_id(user_id);
		cartService.addProductInCart(cartVO);
		System.out.println("cartController(addProductInCart) : " + cartVO.getProduct_id());
		mav.addObject(cartVO);
		mav.setViewName("/product/productDetail.do");
		return mav;
	}
	
}
