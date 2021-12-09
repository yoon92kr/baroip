package com.myspring.baroip.image.controller;


import java.sql.Blob;
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
		

		// multipart로 전달된 첨부파일의 name 속성값 전체 수령
		Iterator<String> imageFileNames = multipartRequest.getFileNames();

		while (imageFileNames.hasNext()) {
			// imageFile 객체에 하나씩 대입

			MultipartFile imageFile = multipartRequest.getFile(imageFileNames.next());
			if (imageFile != null) {
				imageVO.setImage_match_id(match_id);
				imageVO.setImage_category(imageFileNames.next());
				imageVO.setImage_file_name(imageFile.getOriginalFilename());
				byte[] bytes = imageFile.getBytes();
				Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
				
				imageVO.setImage_file(blob);

				// 대입된 자료를 mapper.image.insertImage 로 전송
				String imageName = imageService.addImageFile(imageVO);

				System.out.printf("[%s] 이미지 파일이 DataBase에 저장되었습니다.%n", imageName);
			}
		}

	}

}
