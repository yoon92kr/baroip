package com.myspring.baroip.user.naver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.baroip.user.service.UserService;
import com.myspring.baroip.user.vo.UserVO;

public class UserProfile {
	@Autowired
	private static UserService userService;
	
	public static void profile(String accessToken) throws Exception {
		String token = accessToken; // 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가

		String apiURL = "https://openapi.naver.com/v1/nid/me";

		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL, requestHeaders);

		System.out.println(responseBody);
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(responseBody);
			org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) obj;
			org.json.simple.JSONObject response_obj = (org.json.simple.JSONObject) jsonObj.get("response");
			
			String naverEmail = (String) response_obj.get("email");
			String naverName = (String) response_obj.get("name");
			String phone = (String) response_obj.get("mobile");
			String mobile[] = phone.split("-");
			
			System.out.println(phone);
			System.out.println(response_obj.toString());
			
			UserVO userVO = new UserVO();
			userVO.setUser_id(naverEmail);
			userVO.setUser_email(naverEmail);
			userVO.setUser_name(naverName);
			userVO.setUser_mobile_1(mobile[0]);
			userVO.setUser_mobile_2(mobile[1]);
			userVO.setUser_mobile_3(mobile[2]);
			
			userService.naverLogin(userVO);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
