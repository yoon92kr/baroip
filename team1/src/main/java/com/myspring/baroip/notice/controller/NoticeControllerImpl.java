package com.myspring.baroip.notice.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;



@Controller("noticeController")
@RequestMapping(value="/notice")
public class NoticeControllerImpl{


	// 공지사항 리스트페이지
	@RequestMapping(value= "/notice_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 공지사항 상세페이지
		@RequestMapping(value= "/notice_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView notice_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}



	
}
