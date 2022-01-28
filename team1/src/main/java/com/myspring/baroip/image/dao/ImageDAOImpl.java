//2021.12.13 윤상현

package com.myspring.baroip.image.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.baroip.image.vo.ImageVO;

@Repository("imageDAO")
public class ImageDAOImpl implements ImageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String insertImageFile(ImageVO imageVO) throws DataAccessException {
		sqlSession.insert("mapper.image.insertImage",imageVO);
		
		String imageName = imageVO.getImage_file_name();
		return imageName;
	}
	
	@Override
	public ImageVO selectProductImages(Map<String, String> option) throws DataAccessException {
		
		ImageVO image = sqlSession.selectOne("mapper.image.selectProductImage", option);
		
		return image;
	}
	
	@Override
	public List<String> selectImageCategory(String match_id) throws DataAccessException {
		
		List<String> categoryList = sqlSession.selectList("mapper.image.selectImageCategory", match_id);
		
		return categoryList;
		
	}
	
	@Override
	public String updateImageFile(ImageVO imageVO) throws DataAccessException {
		sqlSession.update("mapper.image.updateImage", imageVO);
		
		String imageName = imageVO.getImage_file_name();
		return imageName;
	}
	
	@Override
	public void clearBodyImage(String match_id) throws DataAccessException {
		sqlSession.delete("mapper.image.clearBodyImage", match_id);
	}
	
	@Override
	public List<ImageVO> selectAllImage(Map<String, String> option) throws DataAccessException {
		
		List<ImageVO> imageList = sqlSession.selectList("mapper.image.selectAllImage", option);
		
		return imageList;
		
	}
	
	@Override
	public List<ImageVO> selectImgOne (String product_id) throws DataAccessException {
		
		List<ImageVO> imageList = sqlSession.selectList("mapper.image.selectImgOne", product_id);
		
		return imageList;
	}
	
//	상품 후기 고객 등록 이미지
	@Override
	public List<ImageVO> selectCommentImg (String notice_id) throws DataAccessException {
		
		List<ImageVO> commentImg = sqlSession.selectList("mapper.image.commentImg", notice_id);
		
		return commentImg;
		
	}

}
