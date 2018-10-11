package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
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
	public int insertGoods(GoodsDTO g_dto) throws Exception  {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne(namespace + ".goodsMaxNum");
		
		g_dto.setG_NUM(maxNum + 1);
		
		sessionTemplate.insert(namespace + ".insertGoods", g_dto);
		
		return g_dto.getG_NUM();
		
	}
	
	@Override
	public void insertGoodsDetail(GoodsDetailDTO gd_dto, int g_num) throws Exception {
		
		//상품 번호 세팅
		gd_dto.setGdNum(g_num);
		
		//for문 돌려서 데이터 삽입
		
		String gCode;
		
		//상품 코드 세팅
		gCode = gd_dto.getGdNum() + "-" + gd_dto.getGdKindNum() + "-" + gd_dto.getGdDevice() + "-" + gd_dto.getGdColor();		
		gd_dto.setGdCode(gCode);
		
		sessionTemplate.insert(namespace + ".insertGoodsDetail", gd_dto);
		
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
