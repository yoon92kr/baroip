// 2021.12.08 윤상현

package com.myspring.baroip.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminProduct.service.AdminProductService;
import com.myspring.baroip.image.controller.ImageController;
import com.myspring.baroip.product.vo.ProductVO;

@Controller("adminProductController")
@RequestMapping(value = "/admin/product")
public class AdminProductControllerImpl implements AdminProductController {
	
	@Autowired
	private AdminProductService adminProductService;
	@Autowired
	private ImageController imageController;
	
	// 상품관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}


	// 상품 임시 등록
	@Override
	@RequestMapping(value = "/addProduct.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String product_id = adminProductService.addProduct(productVO);
		String message = "["+product_id+"]의 임시등록이 완료되었습니다.";
		mav.addObject("message", message);
		mav.setViewName("/admin/product/list");
		
		imageController.ImageSetImageVO(multipartRequest, product_id);

		// 등록된 상품 이미지 파일 저장
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/addProduct.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectExtraList(HttpServletRequest Request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		

		// 등록된 상품 이미지 파일 저장
		return mav;
	}
	
}
