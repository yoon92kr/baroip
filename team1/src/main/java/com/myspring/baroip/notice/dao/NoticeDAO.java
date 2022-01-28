// 2021.12.24 임석희

package com.myspring.baroip.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface NoticeDAO {
	
//	공지사항 리스트페이지
	public List<NoticeVO> noticeList() throws DataAccessException;
	
//	공지사항 상세
	public NoticeVO noticeDetail(String notice_id) throws DataAccessException;

//	상품후기
	public List<NoticeVO> selectCommentList(String product_id) throws DataAccessException;
	
//	상품 문의
	public List<NoticeVO> selectPQAList(String product_id) throws DataAccessException;

}
