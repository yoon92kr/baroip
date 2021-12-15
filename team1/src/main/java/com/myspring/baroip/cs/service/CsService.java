package com.myspring.baroip.cs.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsService {
	
//	자주 묻는 질문 리스트
	public List<CsVO> QAList() throws Exception;
	
//	1:1 문의 리스트
	public List<CsVO> questList() throws Exception;
	
//	1:1문의 작성
	public void addNewQuest(CsVO csVO) throws Exception;

//	1:1 문의 상세
	public String questDetail() throws Exception;
}
