package com.myspring.baroip.adminNotice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminNotice.service.AdminNoticeService;

@Controller("adminNoticeController")
@RequestMapping(value="/admin")
public class AdminNoticeControllerImpl implements AdminNoticeController {
	@Autowired
	AdminNoticeService adminNoticeService;
	
//	관리자페이지 공지사항관리페이지
	@RequestMapping(value= "/adminNotice_01.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
}
