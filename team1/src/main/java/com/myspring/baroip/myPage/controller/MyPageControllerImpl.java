// 2022.01.24 윤상현

package com.myspring.baroip.myPage.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.myPage.service.MyPageService;
import com.myspring.baroip.user.vo.UserVO;



@Controller("myPageController")
@RequestMapping(value="/myPage")
public class MyPageControllerImpl implements MyPageConroller{
	
	@Autowired
	private MyPageService myPageService;

	

	// 전체 맵핑
	@RequestMapping(value= "/*.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception{

		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 마이페이지 메인 컨트롤러
	@RequestMapping(value= "/myInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("userInfo") == null) {
			mav.setViewName("redirect:/main.do");
		}
		
		else {
			
			String viewName = (String)request.getAttribute("viewName");
			UserVO userVO = (UserVO)session.getAttribute("userInfo");
			
			int orderCount = myPageService.myPageOrderCount(userVO);
			int cartCount = myPageService.myPageCartCount(userVO);
			
			mav.addObject("orderCount", orderCount);
			mav.addObject("cartCount", cartCount);
			mav.setViewName(viewName);
				
		}
		

		return mav;
	}
	
	
	// 회원정보 수정
	@RequestMapping(value= "/checkPassword.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_02(@RequestParam("user_pw") String user_pw, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		ModelAndView mav = new ModelAndView();
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		String user_pw_match = userInfo.getUser_pw();
		
		if(user_pw.equals(user_pw_match)) {
			mav.setViewName("/myPage/myPage_02_01");
		} 
		else {
			mav.addObject("message", "비밀번호가 일치하지 않습니다.");
			mav.setViewName("/myPage/myPage_02");
		}

				

		return mav;
	}
	
	// 회원정보 수정 컨트롤러
	@Override
	@RequestMapping(value = "/update_MyInfo.do", method = RequestMethod.POST)
	public ModelAndView updateMyInfo(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		// 회원정보 수정 성공시 1, 아닐경우 0 을 반환
		int flag = myPageService.updateMyInfo(userVO);
		String message = "";
		if (flag == 1) {
			
			UserVO loginUser = (UserVO) session.getAttribute("userInfo");
			message = "회원 " + loginUser.getUser_id() + " 님이 [" + userVO.getUser_id() + "]의 수정을 완료했습니다.";
		}
		else if (flag == 0) {
			message = "회원정보 수정에 문제가 발생하였습니다.";
		}
		
		session.setAttribute("message", message);
		mav.setViewName("redirect:/myPage/myInfo.do");
		System.out.println("baroip : " + message);
		
		return mav;
	}


	
//	
	
//	
//	// 회원탈퇴
//	@RequestMapping(value= "/dropOut_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView dropOut_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 회원탈퇴 완료
//	@RequestMapping(value= "/dropOut_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView dropOut_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//
//
//	@RequestMapping(value= "/myPage_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	

//	// 회원정보 수정 입력
//	@RequestMapping(value= "/myPage_02_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_02_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 주문 배송 조회
//	@RequestMapping(value= "/myPage_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 주문 상세 정보
//	@RequestMapping(value= "/myPage_03_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_03_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 반품 교환 신청
//	@RequestMapping(value= "/myPage_03_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_03_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 상품 후기
//	@RequestMapping(value= "/myPage_03_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_03_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 포인트 내역
//	@RequestMapping(value= "/myPage_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 회원등급 안내
//	@RequestMapping(value= "/myPage_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 문의 내역
//	@RequestMapping(value= "/myPage_06.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_06(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 문의 내역 상세
//	@RequestMapping(value= "/myPage_06_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_06_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 상품 후기
//	@RequestMapping(value= "/myPage_07.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_07(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	
//	// 상품 후기 수정
//	@RequestMapping(value= "/myPage_07_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView user_mypage_07_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}



	
}
