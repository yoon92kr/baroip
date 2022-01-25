// 2021.12.08 윤상현

package com.myspring.baroip.adminOrder.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminOrder.service.AdminOrderService;
import com.myspring.baroip.user.vo.UserVO;

@Controller("adminOrderController")
@RequestMapping(value = "/admin/order")
public class AdminOrderControllerImpl implements AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService;

	// 주문관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/order_list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<Map<String, Object>> orderList = getFullList(info, request);
		
		String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (orderList.size()+8)/9;
			
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
	
	// 주문 상태 수정 컨트롤러
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_state.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String update_amount(@RequestParam Map<String, String> info) throws Exception {

		String order_id = info.get("order_id");
		String delivery_id = info.get("delivery_id");
		
		String message = "주문 번호 ["+order_id+"] 의 상태가 배송중으로 변경 되었습니다.";

		System.out.printf("baorip : [%s]의 배송 상태가 [배송중]으로 변경되었습니다.%n", order_id);

		return message;
	}


	// 상품 조회 필터 사용시, 세션에 있는 상품정보를 확인 후 서비스로 처리하는 메소드
	public List<Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		// Map options에는 조회하고자 하는 조건유형 option, 조건에 해당하는 value 가 반드시 포함되어야한다.
		// search_option(검색 조건) = value [productCreDate / productTitle / productStates / productAmount]
		// search_value(검색 값) = value [yyyy-mm-dd,yyyy-mm-dd / product_main_title / 0 or 1 or all) / int]
		Map<String, String> options = new HashMap<String, String>();
		
		String paramOption = info.get("search_option");
		String paramValue = info.get("search_value");
		
		String sessionOption = (String) session.getAttribute("search_option");
		String sessionValue = (String) session.getAttribute("search_value");
		
		String viewName = (String) request.getAttribute("viewName");
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		String[] viewSplit = viewName.split("/");
		
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
			if (viewName.contains("extra")) {
				options.put("search_option", "productStates");
				options.put("search_value", "0");
			}
			
			else if (viewName.contains("general")) {
				options.put("search_option", "productStates");
				options.put("search_value", "all");
			}
		}
		
		options.put("user_rank", userInfo.getUser_rank());
		options.put("view_name", viewSplit[3]);
		List<Map<String, Object>> fullList = adminOrderService.orderListToOption(options);
		
		return fullList;
	}

}
