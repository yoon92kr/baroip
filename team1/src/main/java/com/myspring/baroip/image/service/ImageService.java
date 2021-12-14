// 2021.12.09 À±»óÇö

package com.myspring.baroip.image.service;

import java.util.List;
import java.util.Map;

import com.myspring.baroip.image.vo.ImageVO;

public interface ImageService {
	
	public String addImageFile(ImageVO imageVO) throws Exception;
	public ImageVO selectProductImage(Map<String, String> option) throws Exception;
	public List<String> selectImageCategory(String match_id) throws Exception;

}
