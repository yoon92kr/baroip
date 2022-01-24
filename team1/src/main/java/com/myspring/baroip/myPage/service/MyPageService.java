// 2022.01.24 윤상현

package com.myspring.baroip.myPage.service;

import com.myspring.baroip.user.vo.UserVO;

public interface MyPageService {

	// user_id 에 해당하는 cart의 전체 수량 select Service
	public int myPageCartCount(UserVO userVO) throws Exception;

	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select Service
	public int myPageOrderCount(UserVO userVO) throws Exception;

}
