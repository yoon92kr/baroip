package com.myspring.baroip.adminNotice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeDAO {
	
//	관리자페이지 공지관리페이지
	public List<NoticeVO> AdminNTList() throws DataAccessException;

}
