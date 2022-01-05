package com.myspring.baroip.product.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.product.vo.ProductVO;

@Controller("productController")
@RequestMapping(value = "/product")
public class ProductControllerImpl implements ProductController {
	
	@Autowired
	private ProductService productService;

	// 상품관리 페이지 전체 mapping
	@Override
	@RequestMapping(value = "/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView product(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/product_list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productList(@RequestParam("pageInfo") String pageInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("pageInfo", pageInfo);
		return mav;
	}
	

	
	@Override
	@RequestMapping(value = "/productDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productDetail(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");		
		Map<String, Map<String, Object>> productInfo = productService.productDetail(product_id);
		
		
		ProductVO product = (ProductVO)productInfo.get("product").get("productVO");
		// 선택된 상품의 카테고리를 식별하여 헤더 style 설정을 위한 세팅
		String pageInfo = "";
		if (product.getProduct_main_category().equals("농산물")) {
			pageInfo = "set_farm";
		}
		else if (product.getProduct_main_category().equals("수산물")) {
			pageInfo = "set_marine";
		} 
		else if (product.getProduct_main_category().equals("축산물")) {
			pageInfo = "set_meat";
		}
		
		HttpSession session = request.getSession();
		String mainImg = (String) productInfo.get("image").get("main");
		List<String> lastImage = new ArrayList<String>();
		List<String> lastProduct = new ArrayList<String>();
		
		
		if(session.getAttribute("lastProduct") != null) {
			
			for(Object item : (ArrayList<?>)session.getAttribute("lastImage")) {
				lastImage.add((String) item);
			}
			
			for(Object item : (ArrayList<?>)session.getAttribute("lastProduct")) {
				lastProduct.add((String) item);
			}
			
			// 기존에 봤던 상품이 lastProduct에 포함되어있지 않은 경우에만 처리
			if(!lastProduct.contains(product_id)) {

				if(lastProduct.size() == 1) {
					lastProduct.add(product_id);
					lastImage.add(mainImg);
					
					session.setAttribute("lastProduct", lastProduct);
					session.setAttribute("lastImage", lastImage);
				}
				else if(lastProduct.size() == 2) {
					lastProduct.set(1, lastProduct.get(0));
					lastProduct.set(0, product_id);
					
					lastImage.set(1, lastImage.get(0));
					lastImage.set(0, mainImg);
					
					session.setAttribute("lastProduct", lastProduct);
					session.setAttribute("lastImage", lastImage);
					
				}
			}

			

		}
		
		// 기존 값이 없을경우 할당.
		else {
			lastProduct.add(product_id);
			lastImage.add(mainImg);
			
			session.setAttribute("lastProduct", lastProduct);
			session.setAttribute("lastImage", lastImage);
		}

		
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("productInfo", productInfo);
		mav.setViewName(viewName);
		return mav;
	}


	

//	// 상품 목록
//	@RequestMapping(value= "/product_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView product_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	
//	// 상품 상세
//	@RequestMapping(value= "/product_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView product_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	
//	// 상품 상세_고객후기
//	@RequestMapping(value= "/product_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView product_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	// 상품 상세_배송안내
//	@RequestMapping(value= "/product_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView product_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	// 상품 상세_상품 문의
//	@RequestMapping(value= "/product_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView product_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}
//	// 상품 문의 작성
//	@RequestMapping(value= "/product_06.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView product_06(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		// HttpSession session;
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}

}
