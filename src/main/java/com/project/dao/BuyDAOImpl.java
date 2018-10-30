package com.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.GoodsDetailDTO;

@Repository
public class BuyDAOImpl implements BuyDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String buyMapper = "com.project.mybatis.buyMapper";

	//상품 코드로 상품 정보 읽어오기
	@Override
	public GoodsDetailDTO getReadGoodsDetail(String gd_code) throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".getReadGoodsDetail", gd_code);
	}

	@Override
	public void goodsDetailCountDown(Map<String, String> map) throws Exception {
		sessionTemplate.update(buyMapper + ".goodsDetailCountDown", map);
	}

	@Override
	public void goodsDetailCountUp(Map<String, String> map) throws Exception {
		sessionTemplate.update(buyMapper + ".goodsDetailCountUp", map);
	}
	
	@Override
	public int ordersMaxNum() throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".ordersMaxNum");
	}

	@Override
	public void insertOrders(Map<String, String> map) throws Exception {
		sessionTemplate.insert(buyMapper + ".insertOrders", map);
		
	}

	@Override
	public void insertOrderDetail(Map<String, String> map) throws Exception {
		sessionTemplate.insert(buyMapper + ".insertOrderDetail", map);
	}
	
	//상품 코드로 상품 정보 읽어오기(오버로딩)
	@Override
	public GoodsDetailDTO getReadGoodsDetail(Map<String, String> map) throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".getReadGoodsDetailMap", map);
	}

}
