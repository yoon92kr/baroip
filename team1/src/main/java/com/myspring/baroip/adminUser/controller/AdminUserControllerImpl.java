// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminUserController")
@RequestMapping(value = "/admin/user")
public class AdminUserControllerImpl implements AdminUserController{

	// rank 2 관리자의 임시상품관리 메뉴 컨트롤러
		@Override
		@RequestMapping(value = "/user_list.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView userList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			
//			 get 요청이 없을경우, 기존의 session을 제거
//			if (info.isEmpty()) {
//				session.removeAttribute("search_option");
//				session.removeAttribute("search_value");
//			}
//			Map<String, Map<String, Object>> userList = getFullList(info, request);

			

			
			String pageNo = info.get("pageNo");
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			
//			if (pageNo != null && pageNo != "") {
//				mav.addObject("pageNo", pageNo);
//			} else {
//				mav.addObject("pageNo", 1);
//			}
//			mav.addObject("userList", userList);
//			mav.setViewName(viewName);

			return mav;
		}
}
