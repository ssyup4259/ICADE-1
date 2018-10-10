package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.GoodsDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String namespace = "com.project.mybatis.adminMapper";

	@Override
	public void insertGoods(GoodsDTO g_dto) throws Exception  {
		
		sessionTemplate.insert(namespace + ".insertGoods", g_dto);
		
	}

	@Override
	public void updateGoods(GoodsDTO g_dto) throws Exception  {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoods(String g_code) throws Exception  {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberDTO> memberList() throws Exception  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void authority(String m_id) throws Exception  {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<OrdersDTO> ordersList() throws Exception  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsDTO> goodsList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
