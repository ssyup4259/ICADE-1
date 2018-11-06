package com.project.dao;

import java.util.HashMap;
import java.util.List;

import com.project.dto.WishDTO;

public interface WishDAO {
/*	//찜목록 체크 리스트(하트)
	public void updateWish(int W_NUM) throws Exception;
	//찜목록 삭제(하트)
	public void updateWishCancel(int W_NUM)throws Exception;
*/
	//찜목록 인클루드 리스트 출력
	public List<WishDTO> wishList(int start, int end,String m_id)throws Exception;
	
	//찜목록 리스트 등록
	public void wishInsert(WishDTO w_dto) throws Exception;
	//찜목록 데이터수
	public int dataCount()throws Exception;
	//찜 목록 카운트
	public int checkCount(HashMap<String, Object> map)throws Exception;
	//찜 목록 체크값 (하트)
	public int likeCheck(int g_num,String m_id)throws Exception;
	//찜 목록 체크값 취소 (하트)
	public int likeCheckCancel(int g_num,String m_id)throws Exception;
	//찜목록 체크값
	public int wCheck(int g_num,String m_id)throws Exception;
	//찜목록 한개 삭제
	public void deleteWish(int g_num,String m_id)throws Exception;
	//찜목록 전체 삭제
	public void deleteAllWish(String m_id)throws Exception;
	//찜목록 옆화면 리스트
	public List<WishDTO> selectWish(String M_ID)throws Exception;
	//찜목록 리스트 출력
	public List<WishDTO> wishListList(int start, int end,String m_id)throws Exception;
	//찜목록 한개의 값 
	public String oneWish(int g_num)throws Exception;
	
	public int idDataCount(String m_id)throws Exception;
	
}
