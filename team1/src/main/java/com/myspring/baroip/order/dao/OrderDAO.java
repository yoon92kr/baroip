// 2022.01.14 윤상현

package com.myspring.baroip.order.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.vo.OrderVO;

public interface OrderDAO {

	// 카트 product_id 에 해당하는 count select DAO
	public int selectCount(CartVO cartVO) throws DataAccessException;

	// 주문 추가 DAO
	public void addOrder(OrderVO orderVO) throws DataAccessException;

	// 주문시 기존 포인트 차감 DAO
	public void updatePointToOrder(OrderVO orderVO) throws DataAccessException;

}
