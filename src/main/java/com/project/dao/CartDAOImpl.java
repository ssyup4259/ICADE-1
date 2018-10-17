package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String cartMapper = "com.project.mybatis.cartMapper";

	//장바구니 리스트
	@Override
	public List<CartDTO> getCartLists(int start, int end, String c_id) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("c_id", c_id);
		
		List<CartDTO> c_lists = sessionTemplate.selectList(cartMapper + ".getCartLists", params);
		
		return c_lists;
	}

	
	//장바구니에 담은 상품 개수 구하기
	@Override
	public int getCartCount() throws Exception {
		return sessionTemplate.selectOne(cartMapper + ".getCartCount");
	}

}
