package com.myspring.baroip.cs.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.cs.vo.CsVO;

public interface CsService {
	public List<CsVO> QAList() throws Exception;
	
	public List<CsVO> questList() throws Exception;
	
	public void addNewQuest(CsVO csVO) throws Exception;


}
