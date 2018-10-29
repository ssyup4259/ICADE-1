package com.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dao.BuyDAO;
import com.project.dto.BuyDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.MemberDTO;

@Service
public class BuyServiceImpl implements BuyService {
	
	@Autowired
	BuyDAO b_dao;
	
	@Autowired
	AdminDAO a_dao;

	@Override
	public HttpServletRequest getReadGoodsDetail(HttpServletRequest req, GoodsDetailDTO gd_dto) throws Exception {
		
		List<BuyDTO> b_lists = new ArrayList<BuyDTO>();
		
		HttpSession session = req.getSession();
		MemberDTO m_dto = (MemberDTO)session.getAttribute("userInfo");
		
		req.setAttribute("m_dto", m_dto);
		
		//단품(구매)이던 여러개(장바구니)던 상품의 정보들을 리스트에 넣어서 뿌려줘야함
		String gd_code = gd_dto.getGD_NUM() + "-" + gd_dto.getGD_KIND_NUM() + "-" + gd_dto.getGD_DEVICE() + "-" + gd_dto.getGD_COLOR();
		
		GoodsDTO g_dto = a_dao.getReadGoods(gd_dto.getGD_NUM());
		GoodsDetailDTO dto = b_dao.getReadGoodsDetail(gd_code);
		
		BuyDTO b_dto = new BuyDTO();
		
		b_dto.setCode(dto.getGD_CODE());
		b_dto.setColor(dto.getGC_COLOR());
		b_dto.setCount(gd_dto.getGD_COUNT());
		b_dto.setDiscount(g_dto.getG_PRICE());
		b_dto.setKind(dto.getDK_NAME());
		b_dto.setName(g_dto.getG_NAME());
		b_dto.setNum(gd_dto.getGD_NUM());
		b_dto.setPrice(g_dto.getG_PRICE());
		b_dto.setSaveFileName(g_dto.getG_SAVEFILENAME());
		
		b_lists.add(b_dto);
		
		req.setAttribute("b_lists", b_lists);
		
		//구매화면에서 Ajax로 결제팝업을 띄우고 결제 완료시 구매화면을 다음화면(구매완료)로 넘기며 DB에 값 저장
		
		return req;
	}
	
	

}
