package com.myspring.baroip.adminNotice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.adminNotice.dao.AdminNoticeDAO;
import com.myspring.baroip.notice.vo.NoticeVO;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	private AdminNoticeDAO adminNoticeDAO;
	
//	관리자페이지 공지관리페이지
	public List<NoticeVO> AdminNTList() throws Exception {
		List<NoticeVO> AdminNTList = adminNoticeDAO.AdminNTList();
		return AdminNTList;
	}

}
