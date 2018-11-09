package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.AdminDAO;
import com.project.dao.BuyDAO;
import com.project.dao.CartDAO;
import com.project.dto.BuyDTO;
import com.project.dto.CartDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

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
		b_dto.setDiscount(g_dto.getG_DISCOUNT());//수정 요함
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
			GoodsDTO g_dto = a_dao.getReadGoods(c_dto.getC_GNUM());
			
			b_dto.setCode(c_dto.getC_CODE());
			b_dto.setColor(c_dto.getC_COLOR());
			b_dto.setCount(c_dto.getC_COUNT());
			b_dto.setDiscount(g_dto.getG_DISCOUNT());//수정 요함
			b_dto.setKind(c_dto.getC_DEVICE());
			b_dto.setName(c_dto.getC_NAME());
			b_dto.setNum(c_dto.getC_GNUM());
			b_dto.setPrice(c_dto.getC_PRICE());
			b_dto.setSaveFileName(c_dto.getC_SAVEFILENAME());
			b_dto.setCnum(c_dto.getC_NUM());
			
			b_lists.add(b_dto);
		}
		
		req.setAttribute("b_lists", b_lists);
		
		return req;
	}

	
	//결제 로직
	@Override
	@Transactional
	public String payIt(HttpServletRequest req, OrdersDTO o_dto) throws Exception {
		
		//해야할 작업
		
		//Start----------------해당 상품의 재고에서 수량 감소, 판매수량 증가------------------
		
		String[] code = req.getParameterValues("code");
		String[] count = req.getParameterValues("count");
		
		for (int i = 0; i < count.length; i++) {

			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("code", code[i]);
			map.put("count", count[i]);
			
			b_dao.goodsDetailCountDown(map);
			
		}
		
		//End----------------해당 상품의 재고에서 수량 감소------------------
		
		//Order, Order_Detail 테이블에 내용 추가
		
		//Start--------------------Orders 테이블에 추가 ------------------------
		HttpSession session = req.getSession();
		MemberDTO m_dto = (MemberDTO)session.getAttribute("userInfo");
		String m_id = m_dto.getM_ID();
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		String ph = req.getParameter("O_PH1") + "-" + req.getParameter("O_PH2") + "-" + req.getParameter("O_PH3");
		
		map.put("O_NUM", Integer.toString(b_dao.ordersMaxNum() + 1));
		String OD_NUM = Integer.toString(b_dao.ordersMaxNum() + 1);//Order_detail의 OD_NUM
		map.put("O_ID", m_id);
		map.put("O_NAME", o_dto.getO_NAME());
		map.put("O_PH", ph);
		map.put("O_ZIPCODE", o_dto.getO_ZIPCODE());
		map.put("O_ADDRESS1", o_dto.getO_ADDRESS1());
		map.put("O_ADDRESS2", o_dto.getO_ADDRESS2());
		map.put("O_TOT", Integer.toString(o_dto.getO_TOT()));
		map.put("O_IMP", req.getParameter("imp_uid"));
		map.put("O_POINT", o_dto.getO_POINT());
		
		b_dao.insertOrders(map);
		
		//End--------------------Orders 테이블에 추가 ------------------------
		
		//Start--------------------Order_Detail 테이블에 추가 ------------------------
		
		for (int i = 0; i < count.length; i++) {

			map = new HashMap<String, Object>();
			
			map.put("gd_code", code[i]);
			map.put("g_num", code[i].substring(0, code[i].indexOf('-')));
			
			GoodsDetailDTO gd_dto = b_dao.getReadGoodsDetail(map);
			
			map = new HashMap<String, Object>();
			
			map.put("OD_NUM", OD_NUM);
			map.put("OD_CODE", code[i]);
			map.put("OD_NAME", gd_dto.getG_NAME());
			map.put("OD_DEVICE", gd_dto.getDK_NAME());
			map.put("OD_COLOR", gd_dto.getGC_COLOR());
			map.put("OD_COUNT", count[i]);
			map.put("OD_PRICE", gd_dto.getG_PRICE());
			map.put("OD_DISCOUNT", Integer.toString(gd_dto.getG_DISCOUNT()));
			
			b_dao.insertOrderDetail(map);
			
		}
		
		//End--------------------Order_Detail 테이블에 추가 ------------------------
		
		//Start--------------------Member 테이블 Point 감소 ------------------------
		
		int m_point = Integer.parseInt(req.getParameter("O_POINT"));
		
		Map<String,Object> hMap = new HashMap<String, Object>();
		
		hMap.put("m_point", m_point);
		hMap.put("m_id", m_id);
		
		b_dao.pointMinus(hMap);
		
		if (m_point > 0) { //포인트를 사용했을경우
			//포인트 적립 X
		} else {
			
			//포인트 적립
			
			m_point = (int)(o_dto.getO_TOT() * 0.1);
			
			hMap = new HashMap<String, Object>();
			
			hMap.put("m_point", m_point);
			hMap.put("m_id", m_id);
			
			b_dao.pointAdd(hMap);
			
		}
		
		//End--------------------Member 테이블 Point 감소 ------------------------
		
		return null;
	}
	
	

}
