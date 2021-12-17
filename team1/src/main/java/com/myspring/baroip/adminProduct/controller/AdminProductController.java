// 2021.12.09 À±»óÇö

package com.myspring.baroip.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductController {
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView selectExtraList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView update_amount(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
