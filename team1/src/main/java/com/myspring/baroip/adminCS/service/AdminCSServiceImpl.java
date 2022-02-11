// 2022.02.10 윤상현

package com.myspring.baroip.adminCS.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.adminCS.dao.AdminCSDAO;
import com.myspring.baroip.notice.vo.NoticeVO;

@Service("adminCSService")
public class AdminCSServiceImpl implements AdminCSService {
	@Autowired
	private AdminCSDAO adminCSDAO;
		
	// 조회 조건에 따른 CS 리스트 조회 서비스
		@Override
		public List<NoticeVO> CSListToOption(Map<String, String> option) throws Exception {

			// option이 productCreDate일 경우, value로 전달된 yyyy-mm-dd,yyyy-mm-dd를 begin, end로 변형하여 다시 대입한다.
			if(option.get("search_option") != null && option.get("search_option").equals("notice_cre_date")) {
				String[] date = option.get("search_value").split(",");
			
				option.remove("search_value");
				option.put("begin", date[0]);
				option.put("end", date[1]);

			}
			
			List<NoticeVO> CSList = adminCSDAO.CSListToOption(option);
			

			return CSList;
		}
		
	//	CS 삭제 Service
	@Override
	public String deleteCS(String notice_id) throws Exception { 
		int result=adminCSDAO.deleteCS(notice_id);
		String message = "baroip : 삭제할 게시물이 존재하지 않습니다.";
		if (result > 0) {
			message = "baroip : "+notice_id+" 게시글이 삭제되었습니다.";
		}
		return message; 
	}
	
	// CS 상세정보 Service
	@Override
	public String CSDetail(Map<String, String> option) throws Exception {
		int result = adminCSDAO.CSDetail(option);
		String message = "baroip : 게시글 등록에 문제가 발생하였습니다.";
		
		if(result > 0) {
			message = "baroip : 게시글이 등록되었습니다.";
		}
		
		return message;
	}
	
	// cs 답글 등록 Service
	@Override
	public String addCS(NoticeVO noticeVO) throws Exception {
		int result = adminCSDAO.addCS(noticeVO);
		String notice_title = noticeVO.getNotice_title();
		String message = "baroip : 게시글 등록에 문제가 발생하였습니다.";
		
		if(result > 0) {
			message = "baroip : "+notice_title+"게시글이 수정되었습니다.";
		}
		
		return message;
	}

}
