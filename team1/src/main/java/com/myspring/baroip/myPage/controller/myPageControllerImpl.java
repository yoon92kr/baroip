package com.myspring.baroip.myPage.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;



@Controller("myPageController")
@RequestMapping(value="/myPage")
public class myPageControllerImpl{

	
	
	
	// 회원탈퇴
	@RequestMapping(value= "/dropOut_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView dropOut_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 회원탈퇴 완료
	@RequestMapping(value= "/dropOut_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView dropOut_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}


	@RequestMapping(value= "/myPage_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 회원정보 수정
	@RequestMapping(value= "/myPage_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 회원정보 수정 입력
	@RequestMapping(value= "/myPage_02_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_02_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 주문 배송 조회
	@RequestMapping(value= "/myPage_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 주문 상세 정보
	@RequestMapping(value= "/myPage_03_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 반품 교환 신청
	@RequestMapping(value= "/myPage_03_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 상품 후기
	@RequestMapping(value= "/myPage_03_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 포인트 내역
	@RequestMapping(value= "/myPage_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 회원등급 안내
	@RequestMapping(value= "/myPage_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 문의 내역
	@RequestMapping(value= "/myPage_06.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_06(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 문의 내역 상세
	@RequestMapping(value= "/myPage_06_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_06_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 상품 후기
	@RequestMapping(value= "/myPage_07.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_07(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 상품 후기 수정
	@RequestMapping(value= "/myPage_07_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_07_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}



	
}
