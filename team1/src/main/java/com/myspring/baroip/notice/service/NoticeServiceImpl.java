// 2021.12.24 임석희

package com.myspring.baroip.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.notice.dao.NoticeDAO;
import com.myspring.baroip.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
//	공지사항 리스트페이지
	public List<NoticeVO> NTList() throws Exception {
		List<NoticeVO> NTList = noticeDAO.NTList();
		return NTList;
	}
	
//	공지사항 상세
	@Override
	public NoticeVO NoticeDetail(String noticeNO) throws Exception {
		NoticeVO noticeID = noticeDAO.NoticeDetail(noticeNO);
		return noticeID;
	}
	
	

	@Override
	public List<NoticeVO> listArticles() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeVO viewArticle(String notice_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		// TODO Auto-generated method stub
		
	}


}