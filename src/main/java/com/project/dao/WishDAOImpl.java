package com.project.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.WishDTO;

@Repository
public class WishDAOImpl implements WishDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplete;
	
	public void setSessionTemplete(SqlSessionTemplate sessionTemplete) throws SQLException{
		this.sessionTemplete = sessionTemplete;
	}
	
	public static String wishMapper = "com.project.mybatis.wishMapper";
	
/*	@Override
	public void updateWish(int W_NUM) throws Exception {
		sessionTemplete.update(wishMapper + ".updateWish",W_NUM);
		
	}

	@Override
	public void updateWishCancel(int W_NUM) throws Exception {

		sessionTemplete.update(wishMapper + ".updateWishCancel",W_NUM);
	}
*/

	@Override
	public List<WishDTO> wishList(int start, int end,String m_id) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end",end);
		params.put("m_id",m_id);
		return sessionTemplete.selectList(wishMapper + ".wishList", params);
		
	}

	@Override
	public void wishInsert(WishDTO w_dto) throws Exception {
		
		 System.out.println(w_dto.getW_ID());
		 int maxNum = 0;
		 maxNum = sessionTemplete.selectOne(wishMapper+".wishMaxNum");
		 w_dto.setW_NUM(maxNum+1);
		 
		 System.out.println("wishInsert 탔다=====================================");
		 System.out.println(w_dto.getW_ID());
		 
		 sessionTemplete.selectList(wishMapper + ".insertWish",w_dto);
		
	}

	@Override
	public int dataCount() throws Exception {

		int result = sessionTemplete.selectOne(wishMapper+".dataCount");
		return result;
	}

	@Override
	public int checkCount(HashMap<String, Object> map) throws Exception {
		
		return sessionTemplete.selectOne(wishMapper + ".checkWish", map);
		
	}

	@Override
	public int likeCheck(int g_num,String m_id) throws Exception {
		
		HashMap<String, Object> map =new HashMap<String, Object>();
		
		map.put("g_num", g_num);
		map.put("m_id", m_id);
		
		return sessionTemplete.update(wishMapper + ".like_check", map);
		
	}

	@Override
	public int likeCheckCancel(int g_num,String m_id) throws Exception {
		
		
	
	HashMap<String, Object> map =new HashMap<String, Object>();
	
	map.put("g_num", g_num);
	map.put("m_id", m_id);
	
	return sessionTemplete.update(wishMapper + ".like_check_cancel", map);
		
	}

	@Override
	public int wCheck(int g_num, String m_id) throws Exception {
		HashMap<String, Object> map =new HashMap<String, Object>();
		
		map.put("g_num", g_num);
		map.put("m_id", m_id);
		int result = sessionTemplete.selectOne(wishMapper + ".wCheck", map);
		
		return result;
				
	}

	@Override
	public void deleteWish(int g_num, String m_id) throws Exception {
		HashMap<String, Object> map =new HashMap<String, Object>();
		
		map.put("g_num", g_num);
		map.put("m_id", m_id);
		sessionTemplete.delete(wishMapper + ".deleteWish",map);
		
	}
	@Override
	public List<WishDTO> selectWish(String M_ID) throws Exception {
		
		
		System.out.println("---------------------------dao 탔다");
		List<WishDTO> lists =new ArrayList<WishDTO>();
				
		lists = sessionTemplete.selectList(wishMapper +".selectWish",M_ID);
		
		
		return lists;
		
	}
	
	@Override
	public List<WishDTO> wishListList(int start, int end,String m_id) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end",end);
		params.put("m_id",m_id);
		return sessionTemplete.selectList(wishMapper + ".wishListList", params);
		
	}



}
