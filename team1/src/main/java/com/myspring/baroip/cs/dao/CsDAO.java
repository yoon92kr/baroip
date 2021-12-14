package com.myspring.baroip.cs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsDAO {
	public List<CsVO> QAList() throws DataAccessException;
	
	public List<CsVO> questList() throws DataAccessException;

	public void insertNewQuest(CsVO csVO) throws DataAccessException;
	
	
}
