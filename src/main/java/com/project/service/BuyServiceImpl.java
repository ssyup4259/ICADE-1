package com.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dao.BuyDAO;
import com.project.dao.CartDAO;
import com.project.dto.BuyDTO;
import com.project.dto.CartDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.MemberDTO;

@Service
public class BuyServiceImpl implements BuyService {
	
	@Autowired
	BuyDAO b_dao;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	CartDAO c_dao;

	//단품 구매
	@Override
	public HttpServletRequest buyOne(HttpServletRequest req, GoodsDetailDTO gd_dto) throws Exception {
		
		List<BuyDTO> b_lists = new ArrayList<BuyDTO>();
		
		HttpSession session = req.getSession();
		MemberDTO m_dto = (MemberDTO)session.getAttribute("userInfo");
		
		req.setAttribute("m_dto", m_dto);
		
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
	
	//여러개 구매(장바구니)
	@Override
	public HttpServletRequest buyCart(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		MemberDTO m_dto = (MemberDTO)session.getAttribute("userInfo");
		
		req.setAttribute("m_dto", m_dto);
		
		List<BuyDTO> b_lists = new ArrayList<BuyDTO>();
		
		String[] c_num = req.getParameterValues("chk");
		
		for (int i = 0; i < c_num.length; i++) {
			CartDTO c_dto = new CartDTO();
			c_dto = c_dao.getCartItem(c_num[i]);
			
			BuyDTO b_dto = new BuyDTO();
			
			b_dto.setCode(c_dto.getC_CODE());
			b_dto.setColor(c_dto.getC_COLOR());
			b_dto.setCount(c_dto.getC_COUNT());
			b_dto.setDiscount(0);//수정 요함
			b_dto.setKind(c_dto.getC_DEVICE());
			b_dto.setName(c_dto.getC_NAME());
			b_dto.setNum(c_dto.getC_GNUM());
			b_dto.setPrice(c_dto.getC_PRICE());
			b_dto.setSaveFileName(c_dto.getC_SAVEFILENAME());
			
			b_lists.add(b_dto);
		}
		
		req.setAttribute("b_lists", b_lists);
		
		return req;
	}
	
	

}
