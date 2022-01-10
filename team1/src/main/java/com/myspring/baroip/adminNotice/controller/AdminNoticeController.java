// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminNoticeController {
	
//	관리자페이지 공지관리 컨트롤러
	public ModelAndView adminNotice(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
