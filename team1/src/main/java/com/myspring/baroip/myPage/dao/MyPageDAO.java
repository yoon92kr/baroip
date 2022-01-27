// 2022.01.24 윤상현

package com.myspring.baroip.myPage.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.user.vo.UserVO;

public interface MyPageDAO {

	// user_id 에 해당하는 cart의 전체 수량 select DAO
	public int myPageCartCount(UserVO userVO) throws DataAccessException;

	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select DAO

	public int myPageOrderCount(UserVO userVO) throws DataAccessException;
	
	// 회원정보 수정 DAO
	public int updateMyInfo(UserVO userVO) throws DataAccessException;
}
