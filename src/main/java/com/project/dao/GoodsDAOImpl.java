package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String goodsMapper = "com.project.mybatis.goodsMapper";
	
	//인기 상품 리스트
	@Override
	public List<GoodsDTO> getPopularLists() throws Exception {
		return sessionTemplate.selectList(goodsMapper + ".getPopularLists");
	}
	
	//최신 상품 리스트
	@Override
	public List<GoodsDTO> getNewLists() throws Exception {
		return sessionTemplate.selectList(goodsMapper + ".getNewLists");
	}
	

	@Override
	public List<GoodsDTO> goodsList(int start, int end, String gdKindNum, String searchKey, String searchValue)
			throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("gdKindNum", gdKindNum);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		return sessionTemplate.selectList(goodsMapper + ".getGoodsLists", params);
	}

	@Override
	public int getGoodsCount(String searchKey, String searchValue) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne(goodsMapper + ".getGoodsCount", params);
		
		return result;
		
	}

	

}
