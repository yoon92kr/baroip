package com.myspring.baroip.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;

import com.myspring.baroip.notice.dao.NoticeDAO;
import com.myspring.baroip.notice.vo.NoticeVO;

@Service("NoticeService")
@Transactional(propagation = Propagation.REQUIRED)
public class NoticeServiceImpl {
	
	@Autowired
	NoticeDAO noticeDAO;

	public List<NoticeVO> listArticles() throws Exception {
		List<NoticeVO> articlesList = boardDAO.selectAllArticlesList();

		return articlesList;
	}


	@Override
	public NoticeVO viewArticle(String notice_id) throws Exception {
		NoticeVO articleVO = NoticeDAO.selectArticle(articleNO);
		return articleVO;
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		noticeDAO.updateArticle(articleMap);
	}

}