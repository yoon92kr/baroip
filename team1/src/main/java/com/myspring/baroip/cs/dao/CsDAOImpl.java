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
	public List<CsVO> csList() throws DataAccessException{
		List<CsVO> QAList = sqlSession.selectList("mapper.cs.csList");
		return QAList;
	}
}
