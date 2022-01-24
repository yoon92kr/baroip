// 2022.01.14 윤상현

package com.myspring.baroip.order.service;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.vo.OrderVO;

public interface OrderService {

	// 상품에 따른 카트 수량 조회 Service
	public int selectCount(CartVO cartVO) throws Exception;

	public void addOrder(OrderVO orderVO) throws Exception;

	// 주문시 기존 포인트 차감 Service
	public void updatePointToOrder(OrderVO orderVO) throws Exception;
}
