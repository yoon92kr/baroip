// 2022.01.14 윤상현

package com.myspring.baroip.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {

	// Order 전체 mapping
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 결제 컨트롤러
	public ModelAndView orderProduct(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
