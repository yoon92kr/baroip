package com.myspring.baroip.cs.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsDAO {
	public List<CsVO> csList() throws DataAccessException;

}
