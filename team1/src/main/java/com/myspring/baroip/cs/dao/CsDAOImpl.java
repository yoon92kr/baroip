package com.myspring.baroip.cs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.cs.vo.CsVO;

import jdk.internal.org.jline.utils.Log;

@Repository("csDAO")
public class CsDAOImpl implements CsDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	자주 묻는 질문 리스트
	@Override
	public List<CsVO> QAList() throws DataAccessException{
		List<CsVO> QAList = sqlSession.selectList("mapper.cs.QAList");
		return QAList;
	}
	
//	1:1 문의 리스트
	@Override
	public List<CsVO> questList() throws DataAccessException {
		List<CsVO> questList = sqlSession.selectList("mapper.cs.questList");
		return questList;
	}
	
//	1:1 문의 작성
	@Override
	public void insertNewQuest(CsVO csVO) throws DataAccessException {
		sqlSession.insert("mapper.cs.insertNewQuest", csVO);
	}
	
//	1:1 문의 상세
	@Override
	public CsVO questDetail(String noticeId) throws DataAccessException {
		return sqlSession.selectOne("mapper.cs.questDetail", noticeId);
	}
	
//	1:1 문의 수정
	public void updateQuest(CsVO csVO) throws  DataAccessException {
		sqlSession.update("mapper.cs.updateQuest", csVO);
	}
}
