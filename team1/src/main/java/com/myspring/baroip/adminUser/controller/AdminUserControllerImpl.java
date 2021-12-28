// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminUser.service.AdminUserService;
import com.myspring.baroip.user.vo.UserVO;

@Controller("adminUserController")
@RequestMapping(value = "/admin/user")
public class AdminUserControllerImpl implements AdminUserController{
	
	@Autowired
	private AdminUserService adminUserService;
	// 전체 회원관리 메뉴 컨트롤러
		@Override
		@RequestMapping(value = "/user_list.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView userList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			
			//get 요청이 없을경우, 기존의 session을 제거
			if (info.isEmpty()) {
				session.removeAttribute("search_option");
				session.removeAttribute("search_value");
			}
			List<UserVO> userList = getFullList(info, request);

			
			String pageNo = info.get("pageNo");
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			
			if (pageNo != null && pageNo != "") {
				mav.addObject("pageNo", pageNo);
			} else {
				mav.addObject("pageNo", 1);
			}
			mav.addObject("userList", userList);
			mav.setViewName(viewName);

			return mav;
		}
		
		// 회원 조회 필터 사용시, 세션에 있는 회원정보를 확인 후 서비스로 처리하는 메소드
		public List<UserVO> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			
			// Map options에는 조회하고자 하는 조건유형 option, 조건에 해당하는 value 가 반드시 포함되어야한다.
			// key "search_option" = value [userJoinDate / userId / all]
			// key "search_value" = value [yyyy-mm-dd,yyyy-mm-dd / product_main_title / 0 or 1(product_states) ]
			Map<String, String> options = new HashMap<String, String>();
			
			String paramOption = info.get("search_option");
			String paramValue = info.get("search_value");
			
			String sessionOption = (String) session.getAttribute("search_option");
			String sessionValue = (String) session.getAttribute("search_value");
			
			String viewName = (String) request.getAttribute("viewName");
	
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
			
			// param과 session에 바인딩된 정보가 없을경우, viewName에 따른 전체 list를 보여준다.
			else {
					options.put("search_option", "rank");
					options.put("search_value", "4");
					}
						
			List<UserVO> fullList = adminUserService.userList(options) ;
			
			return fullList;
		}
}
