//2021.12.13 À±»óÇö

package com.myspring.baroip.image.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.image.vo.ImageVO;

public interface ImageDAO {
	
	public String insertImageFile(ImageVO imageVO) throws DataAccessException;
	public ImageVO selectProductImages(Map<String, String> option) throws DataAccessException;
	public List<String> selectImageCategory(String match_id) throws DataAccessException;
	
}
