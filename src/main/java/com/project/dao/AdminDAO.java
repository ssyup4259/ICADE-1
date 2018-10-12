package com.project.dao;

import java.util.List;

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
	//상품 종류 목록
	public List<DeviceKindDTO> getDeviceList() throws Exception;
	//색상 목록
	public List<GoodsColorDTO> getColorList() throws Exception;
	//상품 등록
	public int insertGoods(GoodsDTO g_dto) throws Exception;
	//상세 상품 등록
	public void insertGoodsDetail(GoodsDetailDTO gd_dto, int g_num) throws Exception;
	//상품 갯수 설정
	public void updateGoodsCount (GoodsDTO g_dto) throws Exception;
	//상품 수정(재고 수정)
	public void updateGoods(GoodsDTO g_dto) throws Exception;
	//상품 삭제
	public void deleteGoods(String g_code) throws Exception;
	//상품 리스트
	public List<GoodsDTO> goodsList(int start, int end, String searchKey, String searchValue) throws Exception;
	//상품 개수 구하기
	public int getGoodsCount(String searchKey,String searchValue) throws Exception;
	//회원 리스트
	public List<MemberDTO> memberList() throws Exception;
	//회원에게 권한 부여
	public void	authority(String m_id) throws Exception;
	//회원 주문내역 조회
	public List<OrdersDTO> ordersList() throws Exception;

}
