// 2022.01.14 À±»óÇö

package com.myspring.baroip.order.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cart.vo.CartVO;
import com.myspring.baroip.order.vo.OrderVO;

public interface OrderDAO {
	
	public int selectCount(CartVO cartVO) throws DataAccessException;
	
	public void addOrder(OrderVO orderVO) throws DataAccessException;

}
