// 2021.12.24 임석희

package com.myspring.baroip.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface NoticeController {
	
//	공지사항 리스트 페이지
	public ModelAndView notice_01(HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
