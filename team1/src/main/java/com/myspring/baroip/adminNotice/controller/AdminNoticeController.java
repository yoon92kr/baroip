package com.myspring.baroip.adminNotice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminNoticeController {
	
//	관리자페이지 공지관리페이지
	public ModelAndView adminNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
