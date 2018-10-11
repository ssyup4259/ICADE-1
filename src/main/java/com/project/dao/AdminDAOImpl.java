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
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne(namespace + ".maxNum");
		
		g_dto.setgNum(maxNum + 1);
		
		//for문 돌려서 데이터 삽입
		
		String gCode;
		
		//gCode = g_dto.getgNum() + "-" + g_dto.getgKindNum() + "-" + g_dto.getgDevice() + "-" + g_dto.getgColor();
		
		//g_dto.setgCode(gCode);
		
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
