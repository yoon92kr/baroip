// 2022.01.14 윤상현

package com.myspring.baroip.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.dao.OrderDAO;
import com.myspring.baroip.order.vo.OrderVO;

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
	
	@Override
	public void addOrder(OrderVO orderVO) throws Exception {
		
		orderDAO.addOrder(orderVO);
		System.out.printf("baroip : [%s] 주문이 완료되었습니다.%n", orderVO.getOrder_id());
		
	}
	
	// 주문시 기존 포인트 차감 Service
	@Override
	public void updatePointToOrder(OrderVO orderVO) throws DataAccessException {
		
		orderDAO.updatePointToOrder(orderVO);
	}

}
