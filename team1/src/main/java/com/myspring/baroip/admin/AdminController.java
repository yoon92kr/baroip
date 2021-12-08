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
	@RequestMapping(value = "/admin.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userInfo");
		
		if(Integer.parseInt(userVO.getUser_rank()) > 1) {
			mav.setViewName("admin");	
		}
		else {
			mav.setViewName("redirect:/main.do");
		}
		
		return mav;
	}

}
