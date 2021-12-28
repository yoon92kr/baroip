// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.user.vo.UserVO;

public interface AdminUserService {

	// 회원 전체 리스트 조회
	public List<UserVO> userList (Map<String, String> option) throws Exception;
}
