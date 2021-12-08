// 2021.12.08 윤상현

package com.myspring.baroip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.baroip.user.vo.UserVO;

public class MainInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			// 요청 view 이름 설정
			String viewName = getViewName(request);

			// admin 접근시 관리자 rank 유효성 검사
			if (viewName.contains("admin")) {
				HttpSession session = request.getSession();
				if (session.getAttribute("userInfo") != null) {
					UserVO userVO = (UserVO) session.getAttribute("userInfo");

					if (Integer.parseInt(userVO.getUser_rank()) > 1) {
						request.setAttribute("viewName", viewName);
					}

					else {
						request.setAttribute("viewName", "redirect:/main.do");
					}
				} else {
					request.setAttribute("viewName", "redirect:/main.do");
				}
			} else {
				request.setAttribute("viewName", viewName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
		}
		System.out.printf("viewName : [%s]%n", fileName);

		return fileName;
	}
}