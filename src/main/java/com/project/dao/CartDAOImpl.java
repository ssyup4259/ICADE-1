package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	//장바구니 추가
	@Override
	public void insertCartItem(CartDTO c_dto) throws Exception {
		
		int c_num = sessionTemplate.selectOne(cartMapper + ".getMaxNum");
		
		c_dto.setC_NUM(c_num + 1);
		
		sessionTemplate.insert(cartMapper + ".insertCartItem", c_dto);
		
	}

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
	public int getCartCount(String c_id) throws Exception {
		return sessionTemplate.selectOne(cartMapper + ".getCartCount", c_id);
	}


	@Override
	public String deleteCartItem(int c_num, String pageNum) throws Exception {
		sessionTemplate.delete(cartMapper + ".deleteCartItem", c_num);
		return pageNum;
	}


	@Override
	public void deleteCartAll(String c_id) throws Exception {
		sessionTemplate.delete(cartMapper + ".deleteCartAll", c_id);
	}


	@Override
	public void updateCartItem(String c_code, int c_count) throws Exception {
		
		Map<String, String> hMap = new HashMap<String, String>();
		
		hMap.put("c_code", c_code);
		hMap.put("c_count", Integer.toString(c_count));
		
		sessionTemplate.update(cartMapper + ".updateCartItem", hMap);
		
	}


	@Override
	public int countGoods(String c_code) throws Exception {
		return sessionTemplate.selectOne(cartMapper + ".countGoods", c_code);
	}


	@Override
	public CartDTO getCartItem(String c_num) throws Exception {
		return sessionTemplate.selectOne("com.project.mybatis.cartMapper.getCartItem", c_num);
	}

}
