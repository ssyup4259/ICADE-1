package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public void insertGoods(GoodsDTO g_dto) {
		
		dao.insertGoods(g_dto);
		
	}
	@Override
	public void updateGoods(GoodsDTO g_dto) {
		
		dao.updateGoods(g_dto);
		
	}

	@Override
	public void deleteGoods(String g_code) {
		
		dao.deleteGoods(g_code);
		
	}

	@Override
	public List<MemberDTO> memberList() {
		
		return dao.memberList();
		
	}

	@Override
	public void authority(String m_id) {
		
		dao.authority(m_id);
		
	}

	@Override
	public List<OrdersDTO> ordersList() {

		return dao.ordersList();
		
	}

}
