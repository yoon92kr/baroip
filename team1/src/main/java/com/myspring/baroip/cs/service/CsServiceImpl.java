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
	
//	자주 묻는 질문 리스트
	@Override
	public List<CsVO> QAList() throws Exception {
		List<CsVO> QAList = csDAO.QAList();
		return QAList;
	}
	
//	1:1 문의 리스트
	@Override
	public List<CsVO> questList() throws Exception {
		List<CsVO> questList = csDAO.questList();
		return questList;
	}
	
//	1:1문의 작성
	@Override
	public void addNewQuest(CsVO csVO) throws Exception {
		csDAO.insertNewQuest(csVO);
	}
	
//	1:1 문의 상세
	@Override
	public CsVO questDetail(String noticeNO) throws Exception {
		CsVO noticeID = csDAO.questDetail(noticeNO);
		return noticeID;
	}
	
//	1:1 문의 수정
	@Override
	public void updateQuest(CsVO csVO) throws  Exception {
		csDAO.updateQuest(csVO);
	}

}
