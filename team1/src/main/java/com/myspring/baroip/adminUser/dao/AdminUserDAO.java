// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.user.vo.UserVO;

public interface AdminUserDAO {
	
	// 전체 회원 리스트 DAO
	public List<UserVO> userList (Map<String, String> option) throws DataAccessException;

}
