package com.project.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.CookieService;
import com.project.service.MyPageService;
import com.project.service.WishService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService my_service;
	@Autowired
	CookieService c_service;
	@Autowired
	AdminDAO a_dao;
	@Autowired
	WishService w_service;
	
	@RequestMapping(value="/myPage.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String mypage(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO vo = new MemberDTO();
		
		vo = (MemberDTO) session.getAttribute("userInfo");
		if(vo != null) {
			w_service.wishList(request);
			}
		String M_ID = vo.getM_ID();
		
		int point = my_service.pointCheck(M_ID);
		
		int o_Tot = my_service.selectSumTot(M_ID);
		int SellCount = my_service.selectCountOnum(M_ID);
		
		int usedPoint = my_service.usedPointCheck(M_ID);
		String jsonM_id = new Gson().toJson(M_ID);
		
		request.setAttribute("SellCount", SellCount);
		request.setAttribute("usedPoint", usedPoint);
		request.setAttribute("jsonM_id", jsonM_id);
		request.setAttribute("o_Tot", o_Tot);
		request.setAttribute("point", point);
		
		c_service.cookieList(request);
		return "/mypage/myPageMain";
	}
	
	@RequestMapping(value="/infoCheckPage.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String chanegeInfo_check(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//myPage 부분에서 받은 모드값을 넘겨서 비밀번호인증 페이지로 가는곳
		
		String mode = request.getParameter("mode");
		
		//System.out.println(mode);
		
		if(mode.equals("")||mode=="") {
			return "/mypage/myPageMain";
		}
		
		request.setAttribute("mode", mode);
		HttpSession session2 = request.getSession();
		MemberDTO mdto=(MemberDTO) session2.getAttribute("userInfo");
		if(mdto != null) {
		w_service.wishList(request);
		}
		c_service.cookieList(request);
		
		return "/mypage/infoCheckPage";
	}
	

	@RequestMapping(value="/infoCheckPage_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String cancelCheckStep1(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//탈퇴버튼 클릭후 나오는 본인확인을 위한 인증 컨트롤러
		c_service.cookieList(request);
		
		HttpSession session = request.getSession();
		
		String mode = request.getParameter("mode");
		
		System.out.println(mode);
		
		if(mode.equals(null)||mode==""){
			return "/mypage/myPageMain";
		}
		
		String M_PW = dto.getM_PW();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		if(vo != null) {
		w_service.wishList(request);
		}
		
		String session_PW = vo.getM_PW();
		
		if(M_PW!=session_PW && !M_PW.equals(session_PW)) {
			
			String msg = "비밀번호가 틀립니다.";
			
			request.setAttribute("msg", msg);
			
			return "/mypage/infoCheckPage"; 
		}
		
		if(mode=="change"||mode.equals("change")){
			return "/mypage/ChangeInfo";
		}else if(mode=="cancel"||mode.equals("cancel")){	
			return "/mypage/cancelMembership";
		}
		
		return "/mypage/mypageMain";
	}
	
	@RequestMapping(value="/changeInfo.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String chanegeInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO mdto=(MemberDTO) session.getAttribute("userInfo");

		if(mdto != null) {
		w_service.wishList(request);
		}
		
		if(mdto==null) {
			
			return "home";
		}
		
		c_service.cookieList(request);
		return "/mypage/ChangeInfo";
	}
	
	@RequestMapping(value="/chanegeInfo_check_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String chanegeInfo_check_ok(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String M_PW = dto.getM_PW();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		
		String session_PW = vo.getM_PW();
		
		if(M_PW!=session_PW && !M_PW.equals(session_PW)) {
			
			String msg = "비밀번호가 틀립니다.";
			
			request.setAttribute("msg", msg);
			return "/mypage/cancelAuthorization"; 
		}
		
		System.out.println("맞으면 여기로");
		if(vo != null) {
			w_service.wishList(request);
		}
		return "/mypage/changInfoAuthorization";
	}
	
	@RequestMapping(value="/changeInfo_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView chanegeInfo_ok(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		if(vo != null) {
			w_service.wishList(request);
		}
		String M_ID = vo.getM_ID();
		
		hMap.put("M_PW", dto.getM_PW());
		hMap.put("M_ZIPCODE", dto.getM_ZIPCODE());
		hMap.put("M_ADDRESS1", dto.getM_ADDRESS1());
		hMap.put("M_ADDRESS2", dto.getM_ADDRESS2());
		hMap.put("M_EMAIL_ID", dto.getM_EMAIL_ID());
		hMap.put("M_EMAIL_DOMAIN", dto.getM_EMAIL_DOMAIN());
		hMap.put("M_CELLPHONE1", dto.getM_CELLPHONE1());
		hMap.put("M_CELLPHONE2", dto.getM_CELLPHONE2());
		hMap.put("M_CELLPHONE3", dto.getM_CELLPHONE3());
		hMap.put("M_NICKNAME", dto.getM_NICKNAME());
		hMap.put("M_ID", M_ID);
		
		my_service.updateInfo(hMap);
		
		session.removeAttribute("userInfo");
		
		MemberDTO vo1 = my_service.userInfo(M_ID);
		
		session.setAttribute("userInfo", vo1);
		
		mav.setViewName("loginTest");
		
		return mav;
	}
	
	@RequestMapping(value="/chanege_check.action", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String chanegeInfo_pwck(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String pw = request.getParameter("pw");
		
		System.out.println(pw);
		
		if(pw!=dto.getM_PW() && !pw.equals(dto.getM_PW())) {
			
			String msg = "비밀번호가 틀립니다.";
			
			return msg; 
		}
		
		String msg = "비밀번호가 맞습니다.";

		return msg;
		
	}
	
	@RequestMapping(value="/cancelMembership_ok.action", method = RequestMethod.POST)
	public String cancelMembership_ok(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		MemberDTO leaveDTO = new MemberDTO();
		
		leaveDTO = (MemberDTO) session.getAttribute("userInfo");
		
		int maxNum = my_service.maxLeaveNum();
		
		String reason = request.getParameter("selected");
		
		String ph = leaveDTO.getM_CELLPHONE1() + "-" + leaveDTO.getM_CELLPHONE2() + "-" + leaveDTO.getM_CELLPHONE3();
		
		hMap.put("L_NUM", maxNum);
		hMap.put("L_ID", leaveDTO.getM_ID());
		hMap.put("L_NAME",leaveDTO.getM_NAME());
		hMap.put("L_REASON",reason);
		hMap.put("L_PH", ph);
		
		my_service.insertLeaveData(hMap);
			
		my_service.cancelMembership(leaveDTO.getM_ID());
		
		session.removeAttribute("userInfo");
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/pwCheckAjax.action", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public boolean pwCheckAjax(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String userPw = dto.getM_PW();
		String inputPw = (String)request.getParameter("pw");

		if(userPw!=inputPw&&!userPw.equals(inputPw)) {
			return false;
		}
		
		return true;
	}
	
	@RequestMapping(value="/refreshAjax.action", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String refreshAjax(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		int pointInt = 0;
		
		String M_ID = request.getParameter("M_ID");
		
		pointInt = my_service.pointCheck(M_ID);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String point = df.format(pointInt);
		
		return point;
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
			
			Cookie[] cookies = req.getCookies();
			
			List<String> c_lists = new ArrayList<String>();
			
			if(cookies != null){
		
				for(int i=0; i<cookies.length; i++){
					
					Cookie ck = cookies[i];
					
					if (ck.getName().equals("JSESSIONID") || ck.getName().equals("Cookie_userid")) {
						
					} else {
						
						String g_num = ck.getName();
						c_lists.add(g_num);
					}
				}
			}
		
			req.setAttribute("c_lists", c_lists);
			List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
			req.setAttribute("gk_lists", gk_lists);
			
			return req;

	}
	
}
