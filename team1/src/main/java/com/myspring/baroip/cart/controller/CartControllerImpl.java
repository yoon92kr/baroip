package com.myspring.baroip.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value= "/*.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mycartList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		// HttpSession session;
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		String user_id = userVO.getUser_id();
		cartVO.setUser_id(user_id);
		ModelAndView mav = new ModelAndView();
		Map<String ,List> cartMap=cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		mav.setViewName(viewName);
		return mav;
	}
	
	
}
