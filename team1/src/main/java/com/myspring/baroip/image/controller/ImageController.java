// 2021.12.09 À±»óÇö

package com.myspring.baroip.image.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.myspring.baroip.image.vo.ImageVO;

public interface ImageController {
	public String addImage(@ModelAttribute("imageVO") ImageVO imageVO, String matchID, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
