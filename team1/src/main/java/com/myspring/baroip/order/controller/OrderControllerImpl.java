// 2022.01.14 윤상현

package com.myspring.baroip.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl implements OrderController{


	// Order 전체 mapping
	@Override
	@RequestMapping(value = "/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// 주문 페이지 이동 컨트롤러
	// post 형식의 배열형태의 product_id를 전송해야 한다.
	@Override
	@RequestMapping(value = "/order_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String[] arrayProductID = request.getParameterValues("product_id");


		for( String product_id : arrayProductID) {
			System.out.println(product_id);
		}

		return mav;
	}
	
	

	
}
