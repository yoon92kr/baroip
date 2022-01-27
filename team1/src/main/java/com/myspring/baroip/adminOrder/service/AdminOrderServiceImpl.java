// 2021.12.09 윤상현

package com.myspring.baroip.adminOrder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.adminOrder.dao.AdminOrderDAO;

@Service("adminOrderService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private AdminOrderDAO adminOrderDAO;
			
	// 조회 조건에 따른 주문 리스트 조회 서비스
	@Override
	public List<Map<String, Object>> orderListToOption( Map<String, String> option) throws Exception {
		
		
		
		if(option.get("search_option") != null && option.get("search_option").equals("orderDate")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);
 
		}

		List<Map<String, Object>> orderList = adminOrderDAO.selectOrderToOption(option);
		
		return orderList;
	}
	
	// 주문 상태 변경서비스
	@Override
	public void updateState(Map<String, String> option) throws Exception {
		
		adminOrderDAO.updateState(option);
		
	}
}
