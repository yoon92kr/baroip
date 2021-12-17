package com.myspring.baroip.cs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CsController {
	
//	자주 묻는 질문 리스트
	public ModelAndView cs_01(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	1:1 문의 리스트
	public ModelAndView cs_02(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;

//	1:1 문의 상세
	public ModelAndView quest_datail(@RequestParam("CsVO") String notice_id, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
