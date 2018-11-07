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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.dao.AdminDAO;
import com.project.dto.OrdersDTO;
import com.project.dto.PaymentsDTO;

@Service
public class RestAPI {
	
	@Autowired
	AdminDAO a_dao;
	
	//토큰 얻기
	public String getToken(JsonObject json) throws Exception{

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
	public PaymentsDTO getInfo(String token, String imp_uid) throws Exception{

		URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
		HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
		httpURLConnection.setRequestProperty("Authorization", token);
		httpURLConnection.setRequestProperty("Content-Type", "application/json; UTF-8");
		httpURLConnection.setRequestMethod("POST");
		httpURLConnection.setUseCaches(false);
		httpURLConnection.setDoInput(true);
		httpURLConnection.setDoOutput(true);
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
		
		PaymentsDTO p_dto = new PaymentsDTO();
		
		if(jsonObj.get("code").getAsInt() == 0){

			JsonObject getToken = (JsonObject) jsonObj.get("response");
			
			p_dto.setAmount(getToken.get("amount").getAsInt());
			p_dto.setBuyer_addr(getToken.get("buyer_addr").toString().substring(1, getToken.get("buyer_addr").toString().length() - 1));
			p_dto.setBuyer_email(getToken.get("buyer_email").toString().substring(1, getToken.get("buyer_email").toString().length() - 1));
			p_dto.setBuyer_name(getToken.get("buyer_name").toString().substring(1, getToken.get("buyer_name").toString().length() - 1));
			p_dto.setBuyer_postcode(getToken.get("buyer_postcode").toString().substring(1, getToken.get("buyer_postcode").toString().length() - 1));
			p_dto.setBuyer_tel(getToken.get("buyer_tel").toString().substring(1, getToken.get("buyer_tel").toString().length() - 1));
			p_dto.setCancel_amount(getToken.get("cancel_amount").getAsInt());
			p_dto.setCancelled_at(getToken.get("cancelled_at").toString());
			p_dto.setChannel(getToken.get("channel").toString().substring(1, getToken.get("channel").toString().length() - 1));
			p_dto.setImp_uid(imp_uid);
			p_dto.setName(getToken.get("name").toString().substring(1, getToken.get("name").toString().length() - 1));
			p_dto.setPaid_at(getToken.get("paid_at").toString());
			p_dto.setPay_method(getToken.get("pay_method").toString().substring(1, getToken.get("pay_method").toString().length() - 1));
			p_dto.setPg_provider(getToken.get("pg_provider").toString().substring(1, getToken.get("pg_provider").toString().length() - 1));
			p_dto.setStatus(getToken.get("status").toString().substring(1, getToken.get("status").toString().length() - 1));
			p_dto.setCard_name(getToken.get("card_name").toString().substring(1, getToken.get("card_name").toString().length() - 1));
			p_dto.setCard_quota(getToken.get("card_quota").getAsInt());
			
			OrdersDTO o_dto = a_dao.getReadOrder(imp_uid);
			
			p_dto.setM_id(o_dto.getO_ID());
			p_dto.setM_name(o_dto.getO_NAME());

		}
		
		return p_dto;

	}

}
