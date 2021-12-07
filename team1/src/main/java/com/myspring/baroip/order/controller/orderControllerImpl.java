package com.myspring.baroip.order.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;



@Controller("orderController")
@RequestMapping(value="/order")
public class orderControllerImpl{



	
	// 회원 주문 / 결제
		@RequestMapping(value= "/order_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView order_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
	// 주문 결제 완료
		@RequestMapping(value= "/order_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView order_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}



	
}
