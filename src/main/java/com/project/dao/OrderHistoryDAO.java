package com.project.dao;

import java.util.List;

import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;

public interface OrderHistoryDAO {
	
	//주문내역조회
	public List<Integer> selectOrderNum(String O_ID) throws Exception;
	
	//주문내역 메인에 뿌려줄 값 조회
	public OrdersDTO selectOrders(String O_ID) throws Exception;
	
	//주문번호를 들어가서 뿌려줄 데이터 조회
	public OrderDetailDTO selectOrder(int OD_NUM) throws Exception;
	
	//상품코드를 통한 글번호(상품번호) 조회
	public int selectGoodsPage(int GD_CODE) throws Exception;
	
	//상품 번호로 저장된 이미지의 saveFileName 받기
	public String selectSaveFile(int G_NUM) throws Exception;

}
