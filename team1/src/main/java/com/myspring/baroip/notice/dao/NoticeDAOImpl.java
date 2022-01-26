// 2021.12.24 임석희

package com.myspring.baroip.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.notice.vo.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	공지사항 리스트
	@Override
	public List<NoticeVO> noticeList() throws DataAccessException{
		List<NoticeVO> NTList = sqlSession.selectList("mapper.notice.noticeList");
		return NTList;
	}
	
//	공지사항 상세
	@Override
	public NoticeVO noticeDetail(String notice_id) throws DataAccessException {
		NoticeVO noticeVO = sqlSession.selectOne("mapper.notice.noticeDetail", notice_id);
		return noticeVO;
	}
	
//	상품후기
	@Override
	public List<NoticeVO> selectCommentList(String product_id) throws DataAccessException {
		List<NoticeVO> commentList = sqlSession.selectList("mapper.notice.selectProductComment", product_id);
		System.out.println("DAO : " + commentList);
		return commentList;
	}

}
