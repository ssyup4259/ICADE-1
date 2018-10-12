package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

public interface AdminService {
	
	//상품 종류 목록
	public List<GoodsKindDTO> getGoodsKindList() throws Exception;	
	//상품 종류 목록
	public List<DeviceKindDTO> getDeviceList() throws Exception;
	//색상 목록
	public List<GoodsColorDTO> getColorList() throws Exception;
	//상품 등록
	public void insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req, HttpServletResponse resp) throws Exception;
	//상품 수정(재고 수정)
	public void updateGoods(GoodsDTO g_dto) throws Exception;
	//상품 삭제
	public void deleteGoods(String g_code) throws Exception;
	//상품 리스트
	public HttpServletRequest goodsList(HttpServletRequest req) throws Exception;
	//회원 리스트
	public List<MemberDTO> memberList() throws Exception;
	//회원에게 권한 부여
	public void	authority(String m_id) throws Exception;
	//회원 주문내역 조회
	public List<OrdersDTO> ordersList() throws Exception;

}
