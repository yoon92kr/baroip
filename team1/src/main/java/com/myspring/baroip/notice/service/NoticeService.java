// 2021.12.24 임석희

package com.myspring.baroip.notice.service;

import java.util.List;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface NoticeService {
	
//	공지사항 리스트페이지
	public List<NoticeVO> NTList() throws Exception;
	
//	공지사항 상세
	public NoticeVO NoticeDetail(String notice_id) throws Exception;
	

}
