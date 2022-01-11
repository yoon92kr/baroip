// 2022.01.10 윤상현

package com.myspring.baroip.adminNotice.service;

import java.util.Map;

public interface AdminNoticeService {
	
//	옵션에 따른 게시글 리스트 조회 Service
	public Map<String, Map<String, Object>> noticeListToOption( Map<String, String> option) throws Exception;
//	게시물 삭제
	public String deleteNotice(String notice_id) throws Exception;
}
