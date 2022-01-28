// 2021.12.24 임석희

package com.myspring.baroip.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface NoticeController {
	
//	공지사항 리스트 페이지
	public ModelAndView notice_list(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;

//	공지사항 상세
	public ModelAndView notice_detail(@RequestParam("NoticeVO") String notice_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	상품 후기
	public ModelAndView productComment(@RequestParam("product_id") String product_id, @RequestParam Map<String, String> info,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
//	상품 문의
	public ModelAndView PQAListPage(@RequestParam("product_id") String product_id, @RequestParam Map<String, String> info,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
