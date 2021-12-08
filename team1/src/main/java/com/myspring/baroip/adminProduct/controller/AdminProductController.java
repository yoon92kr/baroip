package com.myspring.baroip.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductController {
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addProductForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
