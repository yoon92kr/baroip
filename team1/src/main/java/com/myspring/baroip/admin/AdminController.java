// 2021.12.08 À±»óÇö

package com.myspring.baroip.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.user.vo.UserVO;

@Controller
public class AdminController {
	@RequestMapping(value = "/admin/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);	
		
		return mav;
	}
	

}
