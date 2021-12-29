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
		
		if(option.get("search_option").equals("joinDate") || option.get("search_option").equals("lastAccess")) {
			String[] date = option.get("search_value").split(",");
		
			option.remove("search_value");
			option.put("begin", date[0]);
			option.put("end", date[1]);
 
		}
		else if (option.get("search_option").equals("rank")) {
			
			String target = option.get("search_value");
			
			if (target.equals("guest")) {
				option.put("search_value", "0");
			}
			else if (target.equals("user")) {
				option.put("search_value", "1");	
			}			
			else if (target.equals("admin")) {
				option.put("search_value", "2");
			}
			
			
			}

		List<UserVO> allUserList = adminUserDAO.userList(option);
		
		return allUserList;
		
	}
}
