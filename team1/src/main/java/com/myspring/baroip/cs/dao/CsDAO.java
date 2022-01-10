package com.myspring.baroip.cs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsDAO {
//	자주 묻는 질문 리스트
	public List<CsVO> QAList() throws DataAccessException;
//	1:1 문의 리스트
	public List<CsVO> questList() throws DataAccessException;
//	1:1 문의 작성
	public void insertNewQuest(CsVO csVO) throws DataAccessException;
//	1:1 문의 상세
	public CsVO questDetail(String noticeId) throws DataAccessException;
//	1:1 문의 수정
	public void updateQuest(CsVO csVO) throws  DataAccessException;
//	1:1 문의 삭제
	public void questDelete(String notice_id) throws DataAccessException;
}
