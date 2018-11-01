package com.project.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.project.dao.OrderHistoryDAO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;
import com.project.util.RestAPI;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryDAO oh_dao;
	
	@Autowired
	RestAPI api;
	
	//주문내역조회
	@Override
	public List<Integer> selectOrderNum(HashMap<String, Object> hMap) throws Exception {
		return oh_dao.selectOrderNum(hMap);
	}

	//주문내역 메인에 뿌려줄 값 조회
	@Override
	public List<OrdersDTO> selectOrders(String O_ID) throws Exception {
		return oh_dao.selectOrders(O_ID);
	}

	//상품코드를 통한 글번호(상품번호) 조회
	@Override
	public int selectGoodsPage(int GD_CODE) throws Exception {
		return oh_dao.selectGoodsPage(GD_CODE);
	}

	//상품번호로 저장된 이미지의 saveFileName 받기
	@Override
	public String selectSaveFile(int G_NUM) throws Exception {
		return oh_dao.selectSaveFile(G_NUM);
	}

	//기간 지정 주문 내역 검사용 
	@Override
	public List<OrdersDTO> selectOrdersCondition(HashMap<String, Object> hmap) throws Exception {
		return oh_dao.selectOrdersCondition(hmap);
	}

	@Override
	public List<OrderDetailDTO> selectOrderDetail(int O_Num) throws Exception {
		return oh_dao.selectOrderDetail(O_Num);
	}

		@Override
	public List<OrderDetailDTO> selectOdSaveFileName(HashMap<String, Object> hMap) throws Exception {

		return oh_dao.selectOdSaveFileName(hMap);
	}

	@Override
	public List<OrderHistoryDTO> OrderHistoryMain(HashMap<String, Object> hMap) throws Exception {

		return oh_dao.OrderHistoryMain(hMap);
	}

	@Override
	public int maxOrders(HashMap<String, Object> hMap) throws Exception {

		return oh_dao.maxOrders(hMap);
	}

	//개인 주문내역 주문 환불
	@Override
	public String cancel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String imp_key = URLEncoder.encode("0721555779852842", "UTF-8");
		String imp_secret = URLEncoder.encode("qSKG3wd6friMZRuJNne1gGg0CQ2gFks6ddNhJ0nZsGMrxgalEpnU5DUIuXYairhwF4Np4boxRaYpr9K5", "UTF-8");
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", imp_key);
		json.addProperty("imp_secret", imp_secret);
		
		String token = api.getToken(req, resp, json);
		String header = "Bearer " + token;
		
		String imp_uid = req.getParameter("imp_uid");
		
		String apiUrl = "https://api.iamport.kr/payments/cancel";
		
		URL url = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setDoInput(true);
        con.setDoOutput(true);
        con.setUseCaches(false);
        con.setRequestMethod("POST");
        con.setRequestProperty("Authorization", header);
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        
        //매개변수 전달
        OutputStream os = con.getOutputStream();
        OutputStreamWriter writer = new OutputStreamWriter(os);
        writer.write("imp_uid="+imp_uid);
        writer.close();

        os.close();
        
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            return "success";
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer sb = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            sb.append(inputLine);
        }
        br.close();
        
        return "fail";
		
	}

}
