// 2021.12.04 한건희
package com.myspring.baroip.user.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.naver.NaverLoginBO;
import com.myspring.baroip.user.service.UserService;
import com.myspring.baroip.user.vo.UserVO;


@Controller("userController")
@RequestMapping(value="/user")
public class UserControllerImpl implements UserController{
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
//		user 전체적인 접근
		@RequestMapping(value= "/*" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
	
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
			System.out.printf("baroip : 권한[%s]레벨의 [%s]님이 로그인 하셨습니다.%n", userVO.getUser_rank(), userVO.getUser_id());
		}
		else {
			String message = "아이디나  비밀번호가 틀립니다. 다시 로그인해주세요.";
			mav.addObject("message", message);
			mav.setViewName("/user/login_01");
		}
		return mav;
	}
	
//	네이버 로그인시 필요 값
	@RequestMapping(value = "login_01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView naverLogin(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		//네이버
		mav.addObject("url", naverAuthUrl);
		mav.setViewName(viewName);
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
	
//	핸드폰번호 인증
	@Override
	@RequestMapping(value= "/userMobileCheck.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public int userMobileCheck(@RequestParam("mobile") String mobile, HttpServletRequest request, HttpServletResponse response)throws Exception {
		int randomNumber = (int)((Math.random() * (9999 - 1000 * 1)) + 1000);
		userService.userPhoneCheck(mobile, randomNumber);
		return randomNumber;
	}
	
//	이메일 인증
	@RequestMapping(value="/emailCheck.do",method={RequestMethod.POST,RequestMethod.GET})
	public int emailCheck(@RequestParam("user_email") String user_email, HttpServletRequest request, HttpServletResponse response)throws Exception {
		String subject = "바로입 회원가입 이메일 인증";
		String content = "";
		String from = "baroipweb@gmail.com";
		String to = user_email;
		int randomNumber = (int)((Math.random() * (9999 - 1000 * 1)) + 1000);
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");;
			content = "바로입 회원가입을 감사드립니다. 이메일 인증 번호는 " + randomNumber + " 입니다.";
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
		return randomNumber;
	}
	
////	비회원 주문시 아이디 생성
////	@Override
//	@RequestMapping(value="/guestLogin.do" ,method = RequestMethod.POST)
//	public String guestLogin (HttpServletRequest request, HttpServletResponse response) throws Exception {
//		response.setContentType("text/html; charset=UTF-8");
//		request.setCharacterEncoding("utf-8");
////		ModelAndView mav = new ModelAndView();
//		HttpSession session=request.getSession();
////		String lastViewName = (String)request.getAttribute("lastViewName");
//		userService.createGuestId();
//		session.setAttribute("loginOn", true);
//		session.setAttribute("userInfo",userVO);
//		return "guest";
//	}
	
//	아이디 중복 검사
	@Override
	@RequestMapping(value="/userIdOverlap.do" ,method = RequestMethod.POST)
	public ResponseEntity userIdOverlap(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = userService.userIdOverlap(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
}
