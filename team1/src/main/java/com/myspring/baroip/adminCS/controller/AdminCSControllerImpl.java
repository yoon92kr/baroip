// 2022.02.10 윤상현

package com.myspring.baroip.adminCS.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminCS.service.AdminCSService;
import com.myspring.baroip.notice.vo.NoticeVO;

@Controller("adminCSController")
@RequestMapping(value="/admin/CS")
public class AdminCSControllerImpl implements AdminCSController {
	@Autowired
	AdminCSService adminCSService;

	//	문의 관리 컨트롤러
	@RequestMapping(value= "/QA_list.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView QAList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String pageNo = info.get("pageNo");
		
		info.put("option", "QA");
		List<NoticeVO> CSList = getFullList(info, request);
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (CSList.size()+5)/6;
			
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
		
		mav.addObject("CSList", CSList);
		mav.setViewName(viewName);

		return mav;
	}
	
	// 후기 관리 컨트롤러
	@Override
	@RequestMapping(value = "/review_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reviewList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	// CS 삭제 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/delete_CS.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteCS(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String message = "";
		System.out.println(message);
		return message;
	}

	
	// CS 답변 추가 양식 컨트롤러
	@Override
	@RequestMapping(value = "/add_QA_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addCSForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		return mav;

	}
	
	// review 답변 추가 양식 컨트롤러
	@Override
	@RequestMapping(value = "/add_review_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addReviewForm(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String) request.getAttribute("viewName");
		
		mav.setViewName(viewName);
		return mav;

	}

	// CS 답변 추가 컨트롤러
	@Override
	@RequestMapping(value = "/add_CS.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addCS(@ModelAttribute("noticeVO") NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String message = "";
		session.setAttribute("message", message);
		
		mav.setViewName("redirect:/admin/notice/notice_list.do");
		
		return mav;
	}
	
	// CS 조회 필터 사용시, 세션에 있는 검색 조건 정보를 확인 후 서비스로 처리하는 메소드
		public List<NoticeVO> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			
			// Map options에는 조회하고자 하는 조건명 notice_category / search_option / search_value / search_state 이 있으며, notice_category은 반드시 포함되어야한다.
			// * notice_category(notice_category 설정) = value [comment / refund / PQA / UQA / notice / FAQ]
			// search_option(검색 조건) = value [notice_cre_date / notice_title /]
			// search_value(검색 값) = value [yyyy-mm-dd,yyyy-mm-dd / notice_title]
			// search_state(답변 상태) = value [all / y / n]
			
			Map<String, String> options = new HashMap<String, String>();
			String paramOption = info.get("search_option");
			String paramValue = info.get("search_value");
			String paramState = info.get("search_state");
			
			String sessionOption = (String) session.getAttribute("search_option");
			String sessionValue = (String) session.getAttribute("search_value");
			String sessionState = (String) session.getAttribute("search_state");

			// search_option 검색조건이 session 혹은 param에 존재할 경우 처리
			if (paramOption != null || sessionOption != null) {
				
				// param에 조건이 있을경우
				if(paramOption != null && sessionOption == null) {
					options.put("search_option", paramOption);
					session.setAttribute("search_option", paramOption);
				}
				// session에 조건이 있을경우
				else if(paramOption == null && sessionOption != null) {
					options.put("search_option", sessionOption);
				}
				// param과 session 모두에 조건이 있을경우
				else {
					// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
					if(paramOption.equals(sessionOption)) {
						options.put("search_option", sessionOption);
					}
					// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
					else {
						options.put("search_option", paramOption);
						session.setAttribute("search_option", paramOption);
					}
				} 
			
			}
			// search_value 검색조건이 session 혹은 param에 존재할 경우 처리			
			if (paramValue != null || sessionValue != null) {
				
				// param에 조건이 있을경우	
				if(paramValue != null && sessionValue == null) {
					options.put("search_value", paramValue);
					session.setAttribute("search_value", paramValue);
				}
				// session에 조건이 있을경우
				else if(paramValue == null && sessionValue != null) {
					options.put("search_value", sessionValue);
				}
				// param과 session 모두에 조건이 있을경우
				else {
					// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
					if(paramValue.equals(sessionValue)) {
						options.put("search_value", sessionValue);
					}
					// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
					else {
						options.put("search_value", paramValue);
						session.setAttribute("search_value", paramValue);
					}
				} 
			
			} 
			// search_state 검색조건이 session 혹은 param에 존재할 경우 처리			
			if (paramState != null || sessionState != null) {
				
				// param에 조건이 있을경우
				if(paramState != null && sessionState == null) {
					options.put("search_state", paramState);
					session.setAttribute("search_state", paramState);
				}
				// session에 조건이 있을경우
				else if(paramState == null && sessionState != null) {
					options.put("search_state", sessionState);
				}
				// param과 session 모두에 조건이 있을경우
				else {
					// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
					if(paramState.equals(sessionState)) {
						options.put("search_state", sessionState);
					}
					// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
					else {
						options.put("search_state", paramState);
						session.setAttribute("search_state", paramState);
					}
				} 
			
			}
			List<NoticeVO> fullList = adminCSService.CSListToOption(options);
			
			return fullList;
		}
}
