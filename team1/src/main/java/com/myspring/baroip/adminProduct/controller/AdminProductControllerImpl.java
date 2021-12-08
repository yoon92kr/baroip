// 2021.12.08 윤상현

package com.myspring.baroip.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.vo.UserVO;

@Controller("adminProductController")
@RequestMapping(value="/admin/product")
public class AdminProductControllerImpl implements AdminProductController {

	// 상품관리 페이지
	@Override
	@RequestMapping(value="/list.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);	
	
		return mav;
	}

	
	// 상품등록 페이지
	@Override
	@RequestMapping(value="/addProduct.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);	
	
		return mav;
	}
}
