package com.myspring.baroip.cs.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cs.vo.CsVO;

public class CsDAOImpl implements CsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public CsVO csList(Map csMap) throws DataAccessException{
		CsVO cs=(CsVO)sqlSession.selectOne("mapper.cs.csResult");
		return cs;
	}
}
