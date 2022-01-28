// 2022.01.24 윤상현

package com.myspring.baroip.myPage.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.user.vo.UserVO;

public interface MyPageService {

	// user_id 에 해당하는 cart의 전체 수량 select Service
	public int myPageCartCount(UserVO userVO) throws Exception;

	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select Service
	public int myPageOrderCount(UserVO userVO) throws Exception;
	
	// 회원정보 수정 서비스
	public int updateMyInfo(UserVO userVO) throws Exception;

	// 조회 조건에 따른 주문 리스트 조회 서비스
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws Exception;
	
	// 구매 확정 서비스
	public void deliveryCompleted(Map<String, String> option) throws Exception;
}
