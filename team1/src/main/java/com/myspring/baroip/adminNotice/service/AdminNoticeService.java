package com.myspring.baroip.adminNotice.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeService {
	
//	관리자페이지 공지관리페이지
	public List<NoticeVO> AdminNTList() throws Exception;

}
