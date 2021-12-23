package com.myspring.baroip.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface NoticeDAO {
	
//	공지사항 리스트페이지
	public List<NoticeVO> NTList() throws DataAccessException;

}
