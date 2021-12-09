// 2021.12.09 À±»óÇö

package com.myspring.baroip.image.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.baroip.image.dao.ImageDAO;
import com.myspring.baroip.image.vo.ImageVO;

@Service("imageService")
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	private ImageDAO imageDAO;

	public String addImageFile(ImageVO imageVO) throws Exception {
		
		String imageName = imageDAO.insertImageFile(imageVO);
		
		return imageName;
	}
}
