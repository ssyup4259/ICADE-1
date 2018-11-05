package com.project.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.OrderDetailDTO;
import com.project.dto.OrderHistoryDTO;
import com.project.dto.OrdersDTO;

@Repository
public class OrdersHistoryDAOImpl implements OrderHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String ordersHistory = "com.project.mybatis.ordersHistoryMapper";

	//주문내역조회
	@Override
	public List<Integer> selectOrderNum(HashMap<String, Object> hMap) throws Exception {
		return sessionTemplate.selectList(ordersHistory + ".selectOrderNum",hMap);
	}

	//페이징 처리를 위한 아이디의 해당 주문한 횟수
	@Override
	public int maxOrders(HashMap<String, Object> hMap) throws Exception {
		return sessionTemplate.selectOne(ordersHistory + ".maxOrders",hMap);
	}

	//상세정보보기 에서 뿌릴 셀렉트문
	@Override
	public List<OrderDetailDTO> selectOrderDetail(HashMap<String, Object> hMap) throws Exception {

		 List<OrderDetailDTO> lists = new ArrayList<OrderDetailDTO>();
		 
		 lists = sessionTemplate.selectList(ordersHistory + ".selectOrderDetail", hMap); 
		
		return lists;
	}

	//주문내역조회 메인 화면 뿌리기
	@Override
	public List<OrderHistoryDTO> OrderHistoryMain(HashMap<String, Object> hMap) throws Exception {

		List<OrderHistoryDTO> lists = sessionTemplate.selectList(ordersHistory + ".OrderHistoryMain",hMap);
		
		return lists;
	}

	//주문상세페이지 받는사람 정보
	@Override
	public OrdersDTO selectRecipientInfo(HashMap<String, Object> hMap) throws Exception {
		
		OrdersDTO dto = new OrdersDTO();
		
		dto = sessionTemplate.selectOne(ordersHistory + ".selectRecipientInfo",hMap);
		
		return dto;
	}



}
