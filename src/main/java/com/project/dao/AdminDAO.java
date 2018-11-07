package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

public interface AdminDAO {
	
	//상품 종류 목록
	public List<GoodsKindDTO> getGoodsKindList() throws Exception;	
	//상품 기종 목록
	public List<DeviceKindDTO> getDeviceList() throws Exception;
	//색상 목록
	public List<GoodsColorDTO> getColorList() throws Exception;
	//상품 등록
	public int insertGoods(GoodsDTO g_dto) throws Exception;
	//상세 상품 등록
	public void insertGoodsDetail(GoodsDetailDTO gd_dto, int g_num) throws Exception;
	//상품 1개의 정보
	public GoodsDTO getReadGoods(int g_num) throws Exception;
	//상품 수정
	public void updateGoods(GoodsDTO g_dto) throws Exception;
	//상품 삭제
	public void deleteGoods(int g_num, String path, String cPath) throws Exception;
	//상품 리스트
	public List<GoodsDTO> goodsList(int start, int end, String gdKindNum, String searchKey, String searchValue) throws Exception;
	//상품 개수 구하기
	public int getGoodsCount(String searchKey,String searchValue) throws Exception;
	//상세 상품의 정보
	public List<GoodsDetailDTO> getReadGoodsDetail(int g_num) throws Exception;
	//재고 수정
	public void updateGoodsDetailCount(HashMap<String, String> hMap) throws Exception;
	//회원 리스트
	public List<MemberDTO> memberList(int start, int end, String m_rank, String searchKey, String searchValue) throws Exception;
	//회원수 구하기
	public int getMemberCount(String m_rank, String searchKey,String searchValue) throws Exception;
	//회원에게 권한 부여
	public void	authorityChange(String m_id, String new_rank) throws Exception;
	//Orders 테이블 전체 갯수 조회
	public int getOrdersCount() throws Exception;
	//회원 주문내역 imp_uid 조회
	public List<String> imp_uidList(Map<String, Object> map) throws Exception;
	//imp_uid로 Orders 테이블 조회
	public OrdersDTO getReadOrder(String imp_uid) throws Exception;
	// 셀렉트 박스에서 기종 선택시 
	public List<GoodsDetailDTO> selectReadData(int g_num) throws Exception;
	//셀렉트 박스에서 기종 선택시 나타난 색상
	public List<GoodsDetailDTO> selectReadDataColor(Map<String, Integer> map) throws Exception;

}
