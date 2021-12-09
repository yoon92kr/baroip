package com.myspring.baroip.image.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.baroip.image.vo.ImageVO;

public interface ImageDAO {
	
	public String insertImageFile(ImageVO imageVO) throws DataAccessException;

}
