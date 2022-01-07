package com.myspring.baroip.cs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsController {
	
//	자주 묻는 질문 리스트
	public ModelAndView cs_01(@RequestParam Map<String, String> info, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	1:1 문의 리스트
	public ModelAndView cs_02(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

//	1:1 문의 상세
	public ModelAndView quest_datail(@RequestParam("CsVO") String notice_id, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	1:1 문의 작성
	public ModelAndView addQuest(@ModelAttribute("csVO") CsVO csVO, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
//	1:1 문의 삭제
	public String quest_Delete(@RequestParam("noticeId") String noticeId,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
