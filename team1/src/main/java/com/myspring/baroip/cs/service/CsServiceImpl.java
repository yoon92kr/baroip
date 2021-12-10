package com.myspring.baroip.cs.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.baroip.cs.dao.CsDAO;
import com.myspring.baroip.cs.vo.CsVO;

public class CsServiceImpl implements CsService {
	
	@Autowired
	private CsDAO csDAO;
	
	@Override
	public CsVO csList(Map csMap) throws Exception {
		return csDAO.csList(csMap);
	}

}
