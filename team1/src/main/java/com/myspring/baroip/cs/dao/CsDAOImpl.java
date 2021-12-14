package com.myspring.baroip.cs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.cs.vo.CsVO;

@Repository("csDAO")
public class CsDAOImpl implements CsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CsVO> QAList() throws DataAccessException{
		List<CsVO> QAList = sqlSession.selectList("mapper.cs.QAList");
		return QAList;
	}
	
	@Override
	public List<CsVO> questList() throws DataAccessException {
		List<CsVO> questList = sqlSession.selectList("mapper.cs.questList");
		return questList;
	}
	
	@Override
	public void insertNewQuest(CsVO csVO) throws DataAccessException {
		sqlSession.insert("mapper.cs.insertNewQuest", csVO);
	}
}
