package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.WishDTO;

public interface WishService {
	//상품리스트 호출
	public HttpServletRequest wishList(HttpServletRequest req)throws Exception;
	
	public void wishInsert(int g_num,HttpServletRequest req)throws Exception;
	
	public int checkWish(int g_num,String m_id)throws Exception;
	
	public void likeCheck(int g_num,String m_id)throws Exception;
	
	public void likeCheckCancel(int g_num,String m_id)throws Exception;
	
	public int wCheck(int g_num,String m_id)throws Exception;
	
	public void deleteWish(int g_num,String m_id)throws Exception;
	
	public List<WishDTO> selectWish(String m_id)throws Exception;

}
