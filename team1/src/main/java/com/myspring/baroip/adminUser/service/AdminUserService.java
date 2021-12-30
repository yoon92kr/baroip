// 2021.12.28 윤상현

package com.myspring.baroip.adminUser.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.user.vo.UserVO;

public interface AdminUserService {

	// 회원 전체 리스트 조회
	public List<UserVO> userList (Map<String, String> option) throws Exception;
	
	// 회원 권한 변경 서비스
	public String updateRank(Map<String, String> option) throws Exception;
	
	// 회원 삭제 서비스
	public String deleteUser(Map<String, String> info) throws Exception;
		
	// 회원 수정 서비스
	public void updateUser(UserVO userVO) throws Exception;
		
}
