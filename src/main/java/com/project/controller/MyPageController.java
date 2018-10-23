package com.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	AdminDAO a_dao;
	
	@RequestMapping(value="/myPage.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String mypage(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO vo = new MemberDTO();
		
		vo = (MemberDTO) session.getAttribute("userInfo");
		
		String M_ID = vo.getM_ID();
		
		int point = service.pointCheck(M_ID);
		
		request.setAttribute("point", point);
		
		//System.out.println("-----------------point------------------------");
		//System.out.println(point);
		
		return "/mypage/myPageMain";
	}
	
	@RequestMapping(value="/changeInfo.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String chanegeInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo")==null) {
			
			System.out.println("세션이 널이라 돌아간다 나중엔 인터셉터로");
			
			return "home";
		}
		
		return "/mypage/ChangeInfo";
	}
	
	@RequestMapping(value="/changeInfo_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView chanegeInfo_ok(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//System.out.println("====================================_ok 탄다===============================================");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		
		String M_ID = vo.getM_ID();
		String M_PW = vo.getM_PW();
		
		if(M_PW!=dto.getM_PW() && !M_PW.equals(dto.getM_PW())) {
			
			String msg = "비밀번호가 틀립니다.";
			
			mav.addObject("msg", msg);
			mav.setViewName("/mypage/ChangeInfo");
			
			//System.out.println(request.getAttribute("msg"));
			
			return mav;
		}
		
		//System.out.println(M_ID);
		//System.out.println(M_PW);
		
		hMap.put("M_PW", M_PW);
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
		
		service.updateInfo(hMap);
		
		session.removeAttribute("userInfo");
		
		//System.out.println("======================================세션삭제까지 끝났다=================================");
		
		MemberDTO vo1 = service.userInfo(M_ID);
		
		session.setAttribute("userInfo", vo1);
		
		mav.setViewName("loginTest");
		
		return mav;
	}
	
	@RequestMapping(value="/chanege_check.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView chanegeInfo_pwck(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mav = new ModelAndView();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String pw = request.getParameter("pw");
		
		System.out.println(pw);
		
		if(pw!=dto.getM_PW() && !pw.equals(dto.getM_PW())) {
			
			String msg = "비밀번호가 틀립니다.";
			
			mav.addObject("msg",msg);
			mav.setViewName("/mypage/cancelAuthorization");
			
			request.setAttribute("msg", msg);
			
			//System.out.println(request.getAttribute("msg"));
			
			return mav; 
		}
		
		String msg = "비밀번호가 맞습니다.";
		
		mav.addObject("msg",msg);
		
		mav.setViewName( "loginTest");
		
		return mav;
		
	}
	
	@RequestMapping(value="/cancelMembership.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String cancelMembership(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		return "/mypage/cancelAuthorization";
	}
	
	@RequestMapping(value="/cancelCheckStep1.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String cancelCheckStep1(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//탈퇴버튼 클릭후 나오는 본인확인을 위한 인증 컨트롤러
		
		HttpSession session = request.getSession();
		
		String M_PW = dto.getM_PW();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		
		String session_PW = vo.getM_PW();
		
		//System.out.println(M_PW);
		//System.out.println(session_PW);
		
		if(M_PW!=session_PW && !M_PW.equals(session_PW)) {
			
			String msg = "비밀번호가 틀립니다.";
			
			request.setAttribute("msg", msg);
			
			//System.out.println(request.getAttribute("msg"));
			
			return "/mypage/cancelAuthorization"; 
		}
		
		System.out.println("맞으면 여기로");
		
		return "/mypage/cancelMembership";
	}
	
	@RequestMapping(value="/cancelMembership_ok.action", method = RequestMethod.POST)
	public String cancelMembership_ok(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		MemberDTO leaveDTO = new MemberDTO();
		
		leaveDTO = (MemberDTO) session.getAttribute("userInfo");
		
		int maxNum = service.maxLeaveNum();
		
		String reason = request.getParameter("selected");
		
		String ph = leaveDTO.getM_CELLPHONE1() + "-" + leaveDTO.getM_CELLPHONE2() + "-" + leaveDTO.getM_CELLPHONE3();
		
		System.out.println(ph);
		
		System.out.println(reason);
		
		hMap.put("L_NUM", maxNum);
		hMap.put("L_ID", leaveDTO.getM_ID());
		hMap.put("L_NAME",leaveDTO.getM_NAME());
		hMap.put("L_REASON",reason);
		hMap.put("L_PH", ph);
		
		service.insertLeaveData(hMap);
			
		service.cancelMembership(leaveDTO.getM_ID());
		
		session.removeAttribute("userInfo");
		
		return "redirect:/";
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	
	
}
