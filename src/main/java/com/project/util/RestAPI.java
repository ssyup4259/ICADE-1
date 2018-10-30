package com.project.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class RestAPI {
	
	//토큰 얻기
	public String getToken(HttpServletRequest req, HttpServletResponse resp, JsonObject json) throws Exception{

		String _token = "";

		try {

			String requestString = "";
			URL url = new URL("https://api.iamport.kr/users/getToken");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder();
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

				String line = null;  

				while ((line = br.readLine()) != null) {  

					sb.append(line + "\n");  

				}

				br.close();

				requestString = sb.toString();

			}

			os.flush();

			connection.disconnect();

			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObj = (JsonObject) jsonParser.parse(requestString);
			
			if(jsonObj.get("code").getAsInt() == 0){

				JsonObject getToken = (JsonObject) jsonObj.get("response");
				_token = getToken.get("access_token").toString();
				_token = _token.substring(1, _token.length() - 1);

			}

		}catch(Exception e){

			e.printStackTrace();

			_token = "";

		}

		return _token;

	}
	
	//고유번호로 조회
	public Map<String,String> getInfo(HttpServletRequest req, HttpServletResponse resp, String token, String imp_uid) throws Exception{

		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestProperty("Authorization", token);
		httpURLConnection.setRequestProperty("Content-Type", "application/json; UTF-8");
		httpURLConnection.setRequestMethod("POST");
		httpURLConnection.setUseCaches(false);
		httpURLConnection.setDoInput(true);
		httpURLConnection.setDoOutput(true);
		
		System.out.println(token);
		
		httpURLConnection.connect();
		
		String requestString = "";
		
		StringBuilder sb = new StringBuilder();
		
		if (httpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {

			BufferedReader br = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "utf-8"));

			String line = null;  

			while ((line = br.readLine()) != null) {  

				sb.append(line + "\n");  

			}

			br.close();

			requestString = sb.toString();
			
		}

		httpURLConnection.disconnect();

		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject) jsonParser.parse(requestString);
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(jsonObj.get("code").getAsInt() == 0){

			JsonObject getToken = (JsonObject) jsonObj.get("response");
			map.put("imp_uid", getToken.get("imp_uid").toString());
			map.put("status", getToken.get("status").toString());
			map.put("amount", getToken.get("amount").toString());

		}
		
		return map;

	}

}
