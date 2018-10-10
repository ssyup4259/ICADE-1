package com.project.service;

import java.util.List;

import com.project.dto.GoodsDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

public interface AdminService {
	
	//상품 등록
	public void insertGoods(GoodsDTO g_dto);
	//상품 수정(재고 수정)
	public void updateGoods(GoodsDTO g_dto);
	//상품 삭제
	public void deleteGoods(String g_code);
	//회원 리스트
	public List<MemberDTO> memberList();
	//회원에게 권한 부여
	public void	authority(String m_id);
	//회원 주문내역 조회
	public List<OrdersDTO> ordersList();

}
