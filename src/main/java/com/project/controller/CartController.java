package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.AdminDAO;
import com.project.dao.CartDAO;
import com.project.dto.CartDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	Logger log = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartService c_service;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	CartDAO c_dao;
	
	//장바구니 리스트 (완성)
	@RequestMapping(value="/cartList.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cartList(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) session.getAttribute("userInfo");
		String c_id = m_dto.getM_ID();
		
		c_service.cartList(req, c_id);
		
		return "cart/cartList";
		
	}
	
	//장바구니 추가 (완성)
	@RequestMapping(value="/insertCart.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String insertCartItem(HttpServletRequest req, GoodsDTO g_dto, GoodsDetailDTO gd_dto) throws Exception {
		
		HttpSession session = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) session.getAttribute("userInfo");
		String c_id = m_dto.getM_ID();
		
		c_service.insertCartItem(c_id, g_dto, gd_dto);
		
		return "redirect:/goods/goodsArticle.action?G_NUM=" + g_dto.getG_NUM();
		
	}
	
	//장바구니 개별 비우기 (완성)
	@RequestMapping(value="/deleteCartItem.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteCartItem(HttpServletRequest req) throws Exception {
		
		int c_num = Integer.parseInt(req.getParameter("c_num"));
		String pageNum = req.getParameter("pageNum");
		
		c_service.deleteCartItem(c_num, pageNum);
		
		return cartList(req);
		
	}
	
	//장바구니 모두 비우기 (완성)
	@RequestMapping(value="/deleteCartAll.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteCartAll(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		MemberDTO m_dto = (MemberDTO) session.getAttribute("userInfo");
		String c_id = m_dto.getM_ID();
		
		c_service.deleteCartAll(c_id);
		
		return "redirect:cartList.action";
		
	}
	
	//장바구니 수량 수정 (완성)
	@RequestMapping(value="/updateCartItem.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateCartItem(HttpServletRequest req) throws Exception {
		
		String c_code = req.getParameter("c_code");
		int c_count = Integer.parseInt(req.getParameter("c_count"));
		String pageNum = req.getParameter("pageNum");
		
		c_service.updateCartItem(c_code, c_count);
		
		return "redirect:cartList.action?pageNum=" + pageNum;
		
	}
	
	//장바구니 재고 확인 (완성)
	@RequestMapping(value="/updateCheck.action", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String updateCheck(HttpServletRequest req) throws Exception {
		
		String c_code = req.getParameter("c_code");
		int c_count = Integer.parseInt(req.getParameter("c_count"));
		String pageNum = req.getParameter("pageNum");
		
		int count = c_dao.countGoods(c_code);
		
		if (count >= c_count) {
			
			return "true";
		}
		
		return "false";
		
	}
	
	//체크한 상품만 구매 하기 위함
	@RequestMapping(value="/cartTest.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String cartTest(HttpServletRequest req) throws Exception {
		
		if (req.getParameterValues("chk") == null || req.getParameterValues("chk").length < 1) {
			return "redirect:cartList.action";
		}
		
		String[] c_num = req.getParameterValues("chk");
		
		List<CartDTO> c_lists = new ArrayList<CartDTO>();
		
		for (int i = 0; i < c_num.length; i++) {
			CartDTO c_dto = new CartDTO();
			c_dto = c_service.getCartItem(c_num[i]);
			
			c_lists.add(c_dto);
		}
		
		req.setAttribute("c_lists", c_lists);
		
		return "cart/cartTest";
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
