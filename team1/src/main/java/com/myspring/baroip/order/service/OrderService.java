// 2022.01.14 윤상현

package com.myspring.baroip.order.service;

import com.myspring.baroip.cart.vo.CartVO;

public interface OrderService {

	// 상품에 따른 카트 수량 조회 Service
	public int selectCount(CartVO cartVO) throws Exception;
}
