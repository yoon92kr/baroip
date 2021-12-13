package com.myspring.baroip.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.service.UserService;
import com.myspring.baroip.user.vo.UserVO;

@Controller("userController")
@RequestMapping(value="/user")
public class UserControllerImpl implements UserController{
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;
	
	
//		user 전체적인 접근
		@RequestMapping(value= "/*" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
	
	
// 로그인 페이지
	@RequestMapping(value= "/login_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_01(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
//	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
//	public ModelAndView login(@RequestParam Map<String, String> loginMap,
//			HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ModelAndView mav = new ModelAndView();
//		UserVO user = userService.login(loginMap);
//		System.out.println("login");
//		System.out.println(user);
//		
//		HttpSession session = request.getSession();
//		
//		return mav;
//	}
	
//	로그인
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> userMap,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			HttpSession session=request.getSession();
			userVO=userService.login(userMap);
		 // 받아온 userVo의 유효성 검토
		 if(userVO!= null && userVO.getUser_id()!=null) {
			// 세션 생성
			session=request.getSession();
			// 접속여부 세션 set
			session.setAttribute("loginOn", true);
			// 회원정보 세션 set
			session.setAttribute("userInfo",userVO);
			
			mav.setViewName("redirect:/main.do");	
			System.out.printf("baroip : [%s]님이 로그인 하셨습니다.%n", userVO.getUser_id());
		}
		else {
			String message = "아이디나  비밀번호가 틀립니다. 다시 로그인해주세요.";
			mav.addObject("message", message);
			mav.setViewName("/user/login_01");
		}
		return mav;
	}
	

	
//	로그아웃
	@Override
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("loginOn");
		session.removeAttribute("userInfo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
//	회원가입
	@Override
	@RequestMapping(value="/addUser.do" ,method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("userVO") UserVO userVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String user_name = userService.addUser(userVO);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("user_name", user_name);
//			System.out.println(user_name);
			mav.setViewName("/user/join_03");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
//	아이디 중복 검사
	@Override
	@RequestMapping(value="/userIdOverlap.do" ,method = RequestMethod.POST)
	public ResponseEntity userIdOverlap(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = userService.userIdOverlap(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		System.out.println(result);
		return resEntity;
	}
	
	// 아이디 비밀번호 찾기
	@RequestMapping(value= "/login_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	/*
	 * // 아이디 찾기 결과
	 * 
	 * @RequestMapping(value= "/login_03.do"
	 * ,method={RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * login_03(HttpServletRequest request, HttpServletResponse response) throws
	 * Exception{ // HttpSession session; ModelAndView mav = new ModelAndView();
	 * String viewName = (String)request.getAttribute("viewName");
	 * mav.setViewName(viewName); return mav; }
	 */
	
	// 비밀번호 찾기
	@RequestMapping(value= "/login_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	/*
	 * // 비밀번호 찾기 완료
	 * 
	 * @RequestMapping(value= "/login_05.do"
	 * ,method={RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * login_05(HttpServletRequest request, HttpServletResponse response) throws
	 * Exception{ // HttpSession session; ModelAndView mav = new ModelAndView();
	 * String viewName = (String)request.getAttribute("viewName");
	 * mav.setViewName(viewName); return mav; }
	 */
	
	// 약관동의
	@RequestMapping(value= "/join_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	/*
	 * // 회원가입 정보 입력
	 * 
	 * @RequestMapping(value= "/join_02.do"
	 * ,method={RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * join_02(HttpServletRequest request, HttpServletResponse response) throws
	 * Exception{ // HttpSession session; ModelAndView mav = new ModelAndView();
	 * String viewName = (String)request.getAttribute("viewName");
	 * mav.setViewName(viewName); return mav; }
	 */
	
	/*
	 * // 회원가입 완료
	 * 
	 * @RequestMapping(value= "/join_03.do"
	 * ,method={RequestMethod.POST,RequestMethod.GET}) public ModelAndView
	 * join_03(HttpServletRequest request, HttpServletResponse response) throws
	 * Exception{ // HttpSession session; ModelAndView mav = new ModelAndView();
	 * String viewName = (String)request.getAttribute("viewName");
	 * mav.setViewName(viewName); return mav; }
	 */

	
}
