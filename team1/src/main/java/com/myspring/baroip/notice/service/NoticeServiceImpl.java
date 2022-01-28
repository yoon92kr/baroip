// 2021.12.24 임석희

package com.myspring.baroip.notice.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;
import com.myspring.baroip.notice.dao.NoticeDAO;
import com.myspring.baroip.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private ImageService imageService;
	
	
//	공지사항 리스트페이지
	public List<NoticeVO> noticeList() throws Exception {
		List<NoticeVO> NTList = noticeDAO.noticeList();
		return NTList;
	}
	
//	공지사항 상세
	@Override
	public NoticeVO noticeDetail(String notice_id) throws Exception {
		NoticeVO noticeVO = noticeDAO.noticeDetail(notice_id);
		return noticeVO;
	}
//	상품후기
	@Override
	public Map<String, Object> productComment(String product_id) throws Exception {
		List<NoticeVO> productCommentList = noticeDAO.selectCommentList(product_id);
		Map<String, Object> commentList = new HashMap<String, Object>();
		
		for(int i = 0; productCommentList.size() > i; i++) {
			
			Map<String, Object> noticeItem = new HashMap<String, Object>();
			noticeItem.put("noticeList", productCommentList.get(i));
			commentList.put("noticeItem" + (i+1), noticeItem);
		}
		
		return commentList;
		
	}
	
//	상품 문의
	@Override
	public Map<String, Object> productQuestion(String product_id) throws Exception {
		List<NoticeVO> productQuestionList = noticeDAO.selectPQAList(product_id);
		Map<String, Object> QuestionList = new HashMap<String, Object>();
		
		for(int i = 0; productQuestionList.size() > i; i++) {
			Map<String, Object> noticeItem = new HashMap<String, Object>();
			noticeItem.put("noticeList", productQuestionList.get(i));
			QuestionList.put("noticeItem" + (i+1), noticeItem);
		}
		
		return QuestionList;
		
	}
	

}