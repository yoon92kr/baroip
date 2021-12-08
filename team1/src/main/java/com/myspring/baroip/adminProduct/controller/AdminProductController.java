package com.myspring.baroip.adminProduct.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminProductController {
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
