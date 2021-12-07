package com.myspring.baroip.product.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;



@Controller("productController")
@RequestMapping(value="/product")
public class productControllerImpl{



	// 상품 목록
	@RequestMapping(value= "/product_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 상품 상세
	@RequestMapping(value= "/product_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 상품 상세_고객후기
	@RequestMapping(value= "/product_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	// 상품 상세_배송안내
	@RequestMapping(value= "/product_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	// 상품 상세_상품 문의
	@RequestMapping(value= "/product_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	// 상품 문의 작성
	@RequestMapping(value= "/product_06.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_06(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	



	
}
