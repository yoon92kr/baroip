// 2021.12.28 À±»óÇö

package com.myspring.baroip.adminUser.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.baroip.adminUser.dao.AdminUserDAO;
import com.myspring.baroip.user.vo.UserVO;

@Service("adminUserService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminUserServiceImpl implements AdminUserService{
	
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	@Override
	public List<UserVO> userList (Map<String, String> option) throws Exception {
		
		List<UserVO> allUserList = adminUserDAO.userList(option);
		
		return allUserList;
		
	}
}
