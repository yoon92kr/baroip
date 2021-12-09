package com.myspring.baroip.image.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.baroip.image.service.ImageService;
import com.myspring.baroip.image.vo.ImageVO;

public class ImageControllerImpl implements ImageController{
	
	@Autowired
	private ImageService imageService;
	
	@Override
	@RequestMapping(value = "/uploadImage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String addImage(@ModelAttribute("imageVO") ImageVO imageVO, String matchID, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String imageName = imageService.addImageFile(imageVO);
		
		return imageName;
	}

}
