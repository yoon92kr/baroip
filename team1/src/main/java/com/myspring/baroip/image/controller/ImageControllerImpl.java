// 2021.12.09 윤상현

package com.myspring.baroip.image.controller;


import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;

@Controller("imageController")
public class ImageControllerImpl implements ImageController{
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private ImageVO imageVO;
	
	@Override
	public void ImageSetImageVO(MultipartHttpServletRequest multipartRequest, String match_id) throws Exception {
		
		//파라미터로 들어오는 match_id는 notice_id / product_id가 되어야함.

		// multipart로 전달된 첨부파일의 name 속성값 전체 대입
		Iterator<String> imageFileNames = multipartRequest.getFileNames();
		
		// 값이 있는지 확인 후 while 조건문 반복
		while (imageFileNames.hasNext()) {	
			// 해당 반복문의 name(product의 경우 body, main, sub) 대입
			String imageCategory =  imageFileNames.next();
			// imageFile 객체에 file객체의 전체 정보를 대입
			MultipartFile imageFile = multipartRequest.getFile(imageCategory);
			if (imageFile != null) {
				if (imageFile.getOriginalFilename() != null && imageFile.getOriginalFilename() != "") {
				imageVO.setImage_match_id(match_id);
				imageVO.setImage_category(imageCategory);
				imageVO.setImage_file_name(imageFile.getOriginalFilename());
				imageVO.setImage_file(imageFile.getBytes());

				// 대입된 자료를 mapper.image.insertImage 로 전송
				String imageName = imageService.addImageFile(imageVO);

				System.out.printf("[%s] 이미지 파일이 DataBase에 저장되었습니다.%n", imageName);
				}
			}
		}

	}

}
