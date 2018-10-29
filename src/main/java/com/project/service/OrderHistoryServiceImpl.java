package com.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.OrderHistoryDAO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryDAO oh_dao;
	
	//주문내역조회
	@Override
	public List<Integer> selectOrderNum(String O_ID) throws Exception {
		return oh_dao.selectOrderNum(O_ID);
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
	public int countSearch(int OD_NUM) throws Exception {
		return oh_dao.countSearch(OD_NUM);
	}

	@Override
	public List<OrderDetailDTO> selectOdSaveFileName(String M_ID) throws Exception {

		return oh_dao.selectOdSaveFileName(M_ID);
	}

}
