package com.myspring.baroip.adminNotice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.notice.vo.NoticeVO;

@Repository("adminNoticeDAO")
public class AdminNoticeDAOImpl implements AdminNoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	관리자페이지 공지관리페이지
	@Override
	public List<NoticeVO> AdminNTList() throws DataAccessException {
		List<NoticeVO> AdminNTList = sqlSession.selectList("mapper.notice.NTList");
		return AdminNTList;
	}

}
