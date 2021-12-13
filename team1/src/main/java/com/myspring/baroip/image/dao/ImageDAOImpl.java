//2021.12.13 À±»óÇö

package com.myspring.baroip.image.dao;

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

	public String insertImageFile(ImageVO imageVO) throws DataAccessException {
		sqlSession.insert("mapper.image.insertImage",imageVO);
		
		String imageName = imageVO.getImage_file_name();
		return imageName;
	}
	
	public ImageVO selectProductImages(Map<String, String> option) throws DataAccessException {
		
		ImageVO image = sqlSession.selectOne("mapper.image.selectProductImage", option);
		
		return image;
	}
}
