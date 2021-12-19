// 2021.12.08 윤상현

package com.myspring.baroip.adminProduct.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.adminProduct.service.AdminProductService;
import com.myspring.baroip.image.controller.ImageController;
import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.product.vo.ProductVO;

@Controller("adminProductController")
@RequestMapping(value = "/admin/product")
public class AdminProductControllerImpl implements AdminProductController {
	
	@Autowired
	private AdminProductService adminProductService;
	@Autowired
	private ImageController imageController;
	@Autowired
	private ProductService productService;
	
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
		HttpSession session=multipartRequest.getSession();
		session.removeAttribute("message");
		session.setAttribute("message", message);
		/* mav.addObject("message", message); */
		mav.setViewName("redirect:/admin/product/list.do");
		
		imageController.ImageSetImageVO(multipartRequest, product_id);

		// 등록된 상품 이미지 파일 저장
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/list.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectExtraList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// product_states가 0인 Product을 호출
		Map<String, Map<String, Object>> extraList = productService.selectProductList("0");
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.addObject("extraList", extraList);
		
		mav.setViewName(viewName);
		

		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/update_amount.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/text; charset=UTF-8" )
	public String update_amount(@RequestParam Map<String, String> info) throws Exception {
		
		adminProductService.updateAmount(info);
		String title = info.get("product_title");
		String amount = info.get("product_amount");
		String message = "["+title+"]의 재고 수량이 ["+amount+"]개로 정상적으로 변경되었습니다.";
		
		System.out.printf("baorip : [%s]의 재고 수량이 [%s]로 변경되었습니다.%n", title, amount);
				

		return message;
	}
	
	@Override
	@RequestMapping(value = "/delete_product.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView delete_product(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		adminProductService.deleteProduct(product_id);
		String message = "해당 상품이 정상적으로 삭제 되었습니다.";
		HttpSession session=request.getSession();
		session.removeAttribute("message");
		session.setAttribute("message", message);
		
		mav.addObject("message", message);
		mav.setViewName("redirect:/admin/product/list.do");
		

		return mav;
	}
	
}
