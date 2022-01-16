// 2022.01.14 윤상현

package com.myspring.baroip.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.dao.OrderDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;
	
	// 상품에 따른 카트 수량 조회 Service
	@Override
	public int selectCount(CartVO cartVO) throws Exception {
		
		int count = orderDAO.selectCount(cartVO);

		return count;

	}

}
