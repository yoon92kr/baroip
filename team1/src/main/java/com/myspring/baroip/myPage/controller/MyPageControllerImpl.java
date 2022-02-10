// 2022.01.24 윤상현

package com.myspring.baroip.myPage.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.image.controller.ImageController;
import com.myspring.baroip.myPage.service.MyPageService;
import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.user.service.UserService;
import com.myspring.baroip.user.vo.UserVO;



@Controller("myPageController")
@RequestMapping(value="/myPage")
public class MyPageControllerImpl implements MyPageConroller{
	
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private UserService userService;
	@Autowired
	private ImageController imageController;

	

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
	public ModelAndView checkPassword(@RequestParam("user_pw") String user_pw, HttpServletRequest request, HttpServletResponse response) throws Exception{
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


	@Override
	@RequestMapping(value = "/myOrder.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView myOrder(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("search_option");
			session.removeAttribute("search_value");
		}
		List<Map<String, Object>> orderList = getFullList(info, request);
		
				
		String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (orderList.size()+4)/5;
			
			if (Integer.parseInt(pageNo) > lastNo) {
				mav.addObject("pageNo", 1);
				mav.setViewName("redirect:"+viewName +".do");
			}
			else {
				mav.addObject("pageNo", pageNo);	
				mav.setViewName(viewName);
			}
			
		} else {
			mav.addObject("pageNo", 1);
			mav.setViewName(viewName);
		}
		mav.addObject("orderList", orderList);
		return mav;

	}
	

	// 주문 조회 필터 사용시, 세션에 있는 주문정보 확인 후 서비스로 처리하는 메소드
	public List<Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		// Map options에는 조회하고자 하는 조건유형 option, 조건에 해당하는 value 가 반드시 포함되어야한다.
		// search_option(검색 조건) = value [orderDate / productId / userId/ states ]
		// search_value(검색 값) = value [yyyy-mm-dd,yyyy-mm-dd / product_id / user_id / 0 or 1 or 2)]
		Map<String, String> options = new HashMap<String, String>();
		
		String paramOption = info.get("search_option");
		String paramValue = info.get("search_value");
		
		String sessionOption = (String) session.getAttribute("search_option");
		String sessionValue = (String) session.getAttribute("search_value");
			
		// param, session 모두 option이 바인딩 되어있는 경우
		if (paramOption != null && sessionOption != null) {

				// 두 옵션이 일치할 경우, options에 기존 session의 값을 대입한다.
				if (paramOption.equals(sessionOption) && paramValue.equals(sessionValue)) {
					options.put("search_option", sessionOption);
					options.put("search_value", sessionValue);
				}

				// 두 옵션이 일치하지 않을 경우, options에 paramOption을 대입하고, 기존 세션을 Override 한다.
				else {
					options.put("search_option", paramOption);
					options.put("search_value", paramValue);

					session.setAttribute("search_option", paramOption);
					session.setAttribute("search_value", paramValue);
				}
			}

			// 세션에 바인딩된 option이 없을경우, options에 paramOption을 대입하고, 세션에 set 한다.
			else if (paramOption != null && sessionOption == null) {
				options.put("search_option", paramOption);
				options.put("search_value", paramValue);

				session.setAttribute("search_option", paramOption);
				session.setAttribute("search_value", paramValue);
			}
		
			// param에 바인딩된 option이 없을경우, session의 option을 대입한다.
			else if (paramOption == null && sessionOption != null) {
				options.put("search_option", sessionOption);
				options.put("search_value", sessionValue);
			}
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		
		options.put("user_id", userVO.getUser_id());
			
		
		List<Map<String, Object>> fullList = myPageService.myOrder(options);
		
		return fullList;
	}
	
	// 주문 상태 변경 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/updateOrder.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String updateOrder(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception {
		HttpSession session = request.getSession();
		
		String point = info.get("point");
		String message = "";
		myPageService.updateOrder(info);
		
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		Map<String, String> userMap = new HashMap<String, String>();
		userMap.put("user_id", userVO.getUser_id());
		userMap.put("user_pw", userVO.getUser_pw());
		
		UserVO newUserInfo = userService.login(userMap);
		session.removeAttribute("userInfo");
		session.setAttribute("userInfo", newUserInfo);
		
		if(info.get("update_option").equals("deliveryCompleted")) {
			message = "해당 주문의 상태가 구매확정으로 변경 되었습니다. 적립 포인트 : "+point;
		}
		else if (info.get("update_option").equals("cancelOrder")) {
			message = "해당 주문이 정상적으로 취소되었습니다.";
		}
	

		return message;
	}
	
	// 주문 취소 페이지 이동 컨트롤러
	@Override
	@RequestMapping(value = "/myOrder/refundForm.do", method =RequestMethod.POST)
	public ModelAndView refundForm(@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		mav.addObject("order_id", order_id);
		
		return mav;

	}
	
	// 반품/교환 신청 컨트롤러
	@Override
	@RequestMapping(value = "/myOrder/askRefund.do", method =RequestMethod.POST)
	public ModelAndView askRefund(@ModelAttribute("noticeVO") NoticeVO noticeVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = multipartRequest.getSession();
				
		String notice_id = myPageService.askRefund(noticeVO);
		String message = "해당 주문의 반품 / 교환 신청이 완료되었습니다.";
		
		session.setAttribute("message", message);

		mav.setViewName("redirect:/myPage/myOrder.do");
		System.out.println("baroip : " + message);
		imageController.ImageSetImageVO(multipartRequest, notice_id);

		return mav;

	}
	
	// 주문 상세페이지 컨트롤러
	@Override
	@RequestMapping(value = "/myOrder/orderDetail.do", method =RequestMethod.POST)
	public ModelAndView orderDetail(@ModelAttribute("order_id") String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		List<Map<String, Object>> orderList = myPageService.orderDetail(order_id);

		mav.addObject("orderList", orderList);
		mav.setViewName(viewName);

		return mav;

	}
	
//	2022.02.08 한건희
	
//	문의 리스트
		@Override
		@RequestMapping(value = "/myQuestion.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView myQuestion(HttpServletRequest request, @RequestParam Map<String, String> info) throws Exception {
			
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("userInfo");
			String user_id = userVO.getUser_id();
			String pageNo = info.get("pageNo");
			List<NoticeVO> questionList = myPageService.questionList(user_id);
			
			if (pageNo != null && pageNo != "") {
				int lastNo = (questionList.size()+7)/8;
				
				if (Integer.parseInt(pageNo) > lastNo) {
					mav.addObject("pageNo", 1);
					mav.setViewName("redirect:"+viewName +".do");
				}
				else {
					mav.addObject("pageNo", pageNo);	
					mav.setViewName(viewName);
				}
				
			} else {
				mav.addObject("pageNo", 1);
				mav.setViewName(viewName);
			}
			
			mav.addObject("questionList", questionList);
			mav.setViewName(viewName);

			return mav;

		}
		
//		문의 상세 페이지
		@Override
		@RequestMapping(value = "/myQuestion/QuestionDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView QuestionDetail(@RequestParam("notice_id") String notice_id, HttpServletRequest request) throws Exception {
			
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			Map<String, Object> result = myPageService.questionDetail(notice_id);
			
			mav.addObject("detail", result);
			mav.setViewName(viewName);
			return mav;
		}
		
//		문의 삭제 컨트롤러
		@RequestMapping(value = "/myQuestion/questionDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView questionDelete(@RequestParam("notice_id") String notice_id) throws Exception {
			ModelAndView mav = new ModelAndView();
			
			int result = myPageService.deleteQuestion(notice_id);
			String resultMSG = "";
			
			if(result == 1) {
				resultMSG = "해당 문의가 삭제되었습니다.";
			} else if(result == 0 ) {
				resultMSG = "문의 삭제가 실패했습니다.";
			}
			
			mav.addObject("resultMSG", resultMSG);
			mav.setViewName("redirect:/myPage/myQuestion.do");
			return mav;
		}
}
