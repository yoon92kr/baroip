// 2022.01.24 윤상현

package com.myspring.baroip.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.notice.vo.NoticeVO;
import com.myspring.baroip.product.vo.ProductVO;
import com.myspring.baroip.user.vo.UserVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// user_id 에 해당하는 cart의 전체 수량 select DAO
	@Override
	public int myPageCartCount(UserVO userVO) throws DataAccessException {
		int cartCount = sqlSession.selectOne("mapper.myPage.myPageCartCount", userVO);
				
		return cartCount;
	}
	
	// user_id 에 해당하는 order의 배송완료 상품의 전체 수량 select DAO
	@Override
	public int myPageOrderCount(UserVO userVO) throws DataAccessException {
		int orderCount = sqlSession.selectOne("mapper.myPage.myPageOrderCount", userVO);
				
		return orderCount;
	}
	
	@Override
	public int updateMyInfo(UserVO userVO) throws DataAccessException{
		
		int flag = sqlSession.update("mapper.myPage.updateMyInfo", userVO);
		
		return flag;
	}
	
	// 조회 조건에 따른 주문 리스트 조회 DAO
	@Override
	public List<Map<String, Object>> myOrder( Map<String, String> option) throws DataAccessException {
		
		List<Map<String, Object>> orderList = sqlSession.selectList("mapper.myPage.selectOrder", option);

		return orderList;
	}
	
	// 주문상태 변경 DAO
		@Override
		public void updateOrder(Map<String, String> option) throws DataAccessException {
			sqlSession.update("mapper.myPage.updateOrder", option);
			
		}
		
	// 반품 등록 DAO 
		@Override
		public String askRefund(NoticeVO noticeVO) throws DataAccessException {
			
			sqlSession.insert("mapper.myPage.askRefund",noticeVO);
			sqlSession.update("mapper.myPage.askRefundUpdate", noticeVO);
			String notice_id = noticeVO.getNotice_id();
						
			return notice_id;
		}
		
		// 주문 정보 호출 DAO
		@Override
		public List<Map<String, Object>> orderDetail(String order_id) throws DataAccessException {
			
			List<Map<String, Object>> orderList = sqlSession.selectList("mapper.myPage.orderDetail", order_id);

			return orderList;
		}
		
//		2022.02.08 한건희
		
		// 상품문의 리스트
		@Override
		public List<NoticeVO> questionList(String user_id) throws DataAccessException {
			List<NoticeVO> result = sqlSession.selectList("mapper.myPage.questionList", user_id);
			return result;
		}
		
//		문의 내역 페이지
		@Override
		public List<NoticeVO> questionDetail(String notice_id) throws DataAccessException {
			List<NoticeVO> result = sqlSession.selectList("mapper.myPage.questionDetail", notice_id);
			return result;
		}
		
//		상품 명
		@Override
		public String productQuestion(String product_id) throws DataAccessException {
			ProductVO productVO = sqlSession.selectOne("mapper.myPage.PQADetail", product_id);
			String product_title = productVO.getProduct_main_title();
			
			return product_title;
		}
		
}
