package com.myspring.baroip.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.cs.dao.CsDAO;
import com.myspring.baroip.cs.vo.CsVO;

@Service("csService")
public class CsServiceImpl implements CsService {
	
	@Autowired
	private CsDAO csDAO;
	
	@Override
	public List<CsVO> csList() throws Exception {
		List<CsVO> QAList = csDAO.csList();
		return QAList;
	}

}
