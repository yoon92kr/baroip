// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface AdminNoticeDAO {
	
	// 옵션에 따른 notice select DAO
	public List<NoticeVO> noticeListToOption( Map<String, String> option) throws DataAccessException;

}
