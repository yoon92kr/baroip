package com.myspring.baroip.cs.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.cs.service.CsService;
import com.myspring.baroip.cs.vo.CsVO;
import com.myspring.baroip.user.vo.UserVO;



@Controller("csController")
@RequestMapping(value="/cs")
public class CsControllerImpl implements CsController {
	@Autowired
	CsService csService;
	@Autowired
	CsVO csVO;
	
	
	// 1:1 문의 상세보기
		@RequestMapping(value= "/*" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
	
	// 고객센터 자주묻는질문
	@Override
	@RequestMapping(value= "/cs_01.do" , method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView cs_01(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		// HttpSession session;
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List<CsVO> QAList = csService.QAList();
//		System.out.println(QAList.get(0).getNotice_title());
		mav.addObject("QAList", QAList);
		mav.addObject("QAListSize", QAList.size());
//		System.out.println(QAList.size());
		mav.setViewName(viewName);
		return mav;
	}
	
	// 1:1문의 리스트
	@Override
	@RequestMapping(value= "/cs_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cs_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List<CsVO> questList = csService.questList();
//		System.out.println(questList.get(0).getNotice_title());
		mav.addObject("questList", questList);
//		System.out.println(QAList.size());
		mav.setViewName(viewName);
		return mav;
	}
	
	// 1:1 문의 작성
		@RequestMapping(value= "/addQuest.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView addQuest(@ModelAttribute("csVO") CsVO csVO, 
				HttpServletRequest request, 
				HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			HttpSession session=request.getSession();
			UserVO user = (UserVO) session.getAttribute("userInfo");
			String user_id = user.getUser_id();
			csVO.setUser_id(user_id);
			csService.addNewQuest(csVO);
			System.out.println(csVO);
			mav.setViewName("viewName");
			try {
				mav.setViewName("/cs/cs_02_01.do");
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			return mav;
		}
	
	
	// 1:1 문의 상세보기
	@RequestMapping(value= "/cs_02_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cs_02_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}


	
}
