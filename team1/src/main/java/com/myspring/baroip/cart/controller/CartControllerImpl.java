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
	
	@Autowired
	private UserVO userVO;
	
	
	// 장바구니 페이지
	@Override
	@RequestMapping(value= "/cartList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		String user_id = userVO.getUser_id();
		cartVO.setUser_id(user_id);
		Map<String, Map<String, Map<String, Object>>> userCartListInfo = cartService.myCartList(cartVO);
		mav.addObject("userCartListInfo", userCartListInfo);
		mav.setViewName(viewName);
		return mav;
		
	}
	
//	상품 상세 페이지 > 장바구니 담기
	@Override
	@ResponseBody
	@RequestMapping(value= "/addProductInCart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String addProductInCart(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		String lastViewName = (String)request.getAttribute("lastViewName");
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		String user_id = userVO.getUser_id();
		cartVO.setUser_id(user_id);
		cartVO.setProduct_id(product_id);
		cartVO.setCart_count(cart_count);
		boolean productInCart = cartService.selectProductInCart(cartVO);
//		System.out.println(productInCart);
//		장바구니에 해당 상품이 있는지 확인
		if(productInCart == true) {
			return "overLapProduct";
		}
		else {
			cartService.addProductInCart(cartVO);
			return "addProduct";
		}
//		String lastView = "redirect:"+lastViewName+".do?product_id=" + product_id;
//		mav.setViewName("redirect:"+lastViewName+".do?product_id=" + product_id);
//		mav.setViewName(lastView);
//		return mav;
	}
	
//	상세페이지 동일 상품 추가
	@Override
	@ResponseBody
	@RequestMapping(value= "/cartInProductOverLap.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String cartInProductOverLap(@RequestParam("product_id") String product_id, @RequestParam("cart_count") int cart_count,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		userVO = (UserVO)session.getAttribute("userInfo");
		String user_id = userVO.getUser_id();
		cartVO.setUser_id(user_id);
		cartVO.setProduct_id(product_id);
		cartVO.setCart_count(cart_count);
		cartService.ProductOverLap(cartVO);
		return "cart_count : " + cartVO.getCart_count();
	}
	
}
