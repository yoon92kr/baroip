// 2022.01.24 윤상현

package com.myspring.baroip.myPage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.vo.UserVO;

public interface MyPageConroller {

	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView checkPassword(@RequestParam("user_pw") String user_pw, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원정보 수정 컨트롤러
	public ModelAndView updateMyInfo(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 조회 기준에 따른 주문정보 조회 컨트롤러
	public ModelAndView myOrder(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 구매확정 컨트롤러
	public String deliveryCompleted(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception;
}


