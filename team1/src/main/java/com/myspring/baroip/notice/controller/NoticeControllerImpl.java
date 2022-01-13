// 2021.12.24 임석희

package com.myspring.baroip.notice.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.notice.service.NoticeService;
import com.myspring.baroip.notice.vo.NoticeVO;


@Controller("noticeController")
@RequestMapping(value="/notice")
public class NoticeControllerImpl implements NoticeController {
	@Autowired
	NoticeService noticeService;
	@Autowired
	NoticeVO noticeVO;

	// 2022.01.12 윤상현 수정
	// 공지사항 리스트페이지
	@RequestMapping(value= "/notice_list.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice_list(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		List<NoticeVO> noticeList = noticeService.noticeList();
		
		String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (noticeList.size()+4)/5;
			
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
		
		mav.addObject("noticeList", noticeList);
		return mav;
	}
	
	// 공지사항 상세페이지
	@Override
	@RequestMapping(value= "/notice_detail.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice_detail(@RequestParam("notice_id") String notice_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{

		noticeVO = noticeService.noticeDetail(notice_id);
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName(viewName);
		return mav;
	}

		
}
