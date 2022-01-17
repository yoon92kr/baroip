// 2022.01.14 윤상현

package com.myspring.baroip.order.controller;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.service.OrderService;
import com.myspring.baroip.product.service.ProductService;
import com.myspring.baroip.user.vo.UserVO;

@Controller("orderController")
@RequestMapping(value = "/order")
public class OrderControllerImpl implements OrderController {

	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;

	// Order 전체 mapping
	@Override
	@RequestMapping(value = "/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}

	// 주문 페이지 이동 컨트롤러
	// post 형식의 배열형태의 product_id를 전송해야 한다.
	@Override
	@RequestMapping(value = "/order_form.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userInfo");
		String viewName = (String) request.getAttribute("viewName");
		String lastViewName = (String) request.getAttribute("lastViewName");
		String[] arrayProductID = request.getParameterValues("product_id");
		Map<String, Map<String, Map<String, Object>>> productList = new HashMap<String, Map<String, Map<String, Object>>>();

		if (arrayProductID.length != 0) {

			for (int i = 0; i < arrayProductID.length; i++) {
				Map<String, Map<String, Object>> productInfo = productService.productDetail(arrayProductID[i]);

				// 장바구니를 통해 주문페이지로 이동했을 경우.
				if (lastViewName.contains("cart")) {

					// 로그인 상태의 경우, cart의 수량을 조회한다.
					if (userVO != null) {
						CartVO cartVO = new CartVO();
						cartVO.setUser_id(userVO.getUser_id());
						cartVO.setProduct_id(arrayProductID[i]);
						int count = orderService.selectCount(cartVO);

						Map<String, Object> order_amount = new HashMap<String, Object>();
						order_amount.put("order_amount", count);
						productInfo.put("count", order_amount);
					}
					// 비회원 상태의 경우 session의 수량을 조회한다.
					else {
						List<CartVO> sessionCart = new ArrayList<CartVO>();

						if (session.getAttribute("guestCartAdd") != null) {

							for (Object item : (ArrayList<?>) session.getAttribute("guestCartAdd")) {
								sessionCart.add((CartVO) item);
							}

							for (CartVO cartVO : sessionCart) {
								if (cartVO.getProduct_id().equals(arrayProductID[i])) {

									int count = cartVO.getCart_count();

									Map<String, Object> order_amount = new HashMap<String, Object>();
									order_amount.put("order_amount", count);
									productInfo.put("count", order_amount);

								}
							}
						}

					}

				}
				else {
					Map<String, Object> order_amount = new HashMap<String, Object>();
					order_amount.put("order_amount", 1);
					productInfo.put("count", order_amount);	
				}
				productList.put("product" + (i + 1), productInfo);
			}

			mav.addObject("productList", productList);
			mav.setViewName(viewName);
		}

		else {
			mav.setViewName("redirect:/main.do");
		}

		return mav;
	}
	
	// 결제 컨트롤러
	@Override
	@RequestMapping(value = "/order_product.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderProduct(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
				
		HttpRequest payRequest = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/payments/"+info.get("paymentKey")))
			    .header("Authorization", "Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==")
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"amount\":"+info.get("amount")+",\"orderId\":\""+info.get("orderId")+"\"}"))
			    .build();
			HttpResponse<String> payResponse = HttpClient.newHttpClient().send(payRequest, HttpResponse.BodyHandlers.ofString());
			System.out.println(payResponse.body());
	
		mav.setViewName("redirect:/order/order_complete.do");
		return mav;
	}
}