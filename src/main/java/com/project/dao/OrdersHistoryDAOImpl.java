package com.project.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;

@Repository
public class OrdersHistoryDAOImpl implements OrderHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String ordersHistory = "com.project.mybatis.ordersHistoryMapper";

	
	@Override
	public List<Integer> selectOrderNum(String O_ID) throws Exception {
		return sessionTemplate.selectList(ordersHistory + ".selectOrderNum",O_ID);
	}

	@Override
	public List<OrdersDTO> selectOrders(String O_ID) throws Exception {
		
		List<OrdersDTO> lists = new ArrayList<OrdersDTO>(); 
				
		lists.add((OrdersDTO) sessionTemplate.selectOne(ordersHistory + ".selectOrders", O_ID));
		
		return lists;
	}

	@Override
	public OrderDetailDTO selectOrder(int OD_NUM) throws Exception {
		return sessionTemplate.selectOne(ordersHistory + ".selectOrderDetail", OD_NUM);
	}

	@Override
	public int selectGoodsPage(int GD_CODE) throws Exception {
		return sessionTemplate.selectOne(ordersHistory + ".selectGoodsPage", GD_CODE);
	}

	@Override
	public String selectSaveFile(int G_NUM) throws Exception {
		return sessionTemplate.selectOne(ordersHistory + ".selectSaveFile", G_NUM);
	}

	@Override
	public List<OrdersDTO> selectOrdersCondition(HashMap<String, Object> hmap) throws Exception {
		return sessionTemplate.selectList(ordersHistory + "selectOrdersCondition");
	}

	@Override
	public List<OrderDetailDTO> selectOrderDetail(int O_Num) throws Exception {

		List<OrderDetailDTO> lists = new ArrayList<OrderDetailDTO>();
		
		lists.add((OrderDetailDTO)sessionTemplate.selectOne(ordersHistory + ".selectOrderDetail",O_Num));
		
		return lists;
	}

}
