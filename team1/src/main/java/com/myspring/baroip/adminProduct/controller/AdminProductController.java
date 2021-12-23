// 2021.12.09 윤상현

package com.myspring.baroip.adminProduct.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.vo.ProductVO;

public interface AdminProductController {

	// 관리자 페이지 상품 등록 전체 매핑
	public ModelAndView adminProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//  관리자 페이지 상품 등록
	public ModelAndView addProduct(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView selectExtraList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  관리자 페이지 상품 수량 변경
	public String update_amount(@RequestParam Map<String, String> info) throws Exception;
	
	// 관리자 페이지 상품 삭제
	public ModelAndView delete_product(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//  관리자 페이지 상품 수정 폼
	public ModelAndView update_product_form (@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 관리자 페이지 상품 수정
	public ModelAndView update_product(@ModelAttribute("productVO") ProductVO productVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// 날짜를 기준으로 상품 조회
	public void search_date(@RequestParam Map<String, String> option) throws Exception;
}
