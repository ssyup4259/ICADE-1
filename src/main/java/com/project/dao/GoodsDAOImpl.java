package com.project.dao;

import java.sql.SQLException;
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

	@Override
	public List<GoodsDTO> goodsList(int start, int end, String gdKindNum, String searchKey, String searchValue)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getGoodsCount(String searchKey, String searchValue) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
