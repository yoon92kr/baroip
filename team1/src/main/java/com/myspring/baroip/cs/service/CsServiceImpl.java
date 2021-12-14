package com.myspring.baroip.cs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.cs.dao.CsDAO;
import com.myspring.baroip.cs.vo.CsVO;

@Service("csService")
public class CsServiceImpl implements CsService {
	
	@Autowired
	private CsDAO csDAO;
	
	@Override
	public List<CsVO> QAList() throws Exception {
		List<CsVO> QAList = csDAO.QAList();
		return QAList;
	}
	
	@Override
	public List<CsVO> questList() throws Exception {
		List<CsVO> questList = csDAO.questList();
		return questList;
	}
	
	@Override
	public void addNewQuest(CsVO csVO) throws Exception {
		csDAO.insertNewQuest(csVO);
	}

}
