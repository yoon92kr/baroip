package com.myspring.baroip.notice.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.notice.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> listArticles() throws Exception;
	public NoticeVO viewArticle(String notice_id) throws Exception;
	public void modArticle(Map articleMap) throws Exception;

}
