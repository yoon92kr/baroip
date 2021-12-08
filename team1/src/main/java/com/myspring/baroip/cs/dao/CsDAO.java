package com.myspring.baroip.cs.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsDAO {
	public CsVO login(Map loginMap) throws DataAccessException;
	
	

}
