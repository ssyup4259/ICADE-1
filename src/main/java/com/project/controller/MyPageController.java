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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
	
	@RequestMapping(value="/infoCheckPage.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String chanegeInfo_check(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//myPage 부분에서 받은 모드값을 넘겨서 비밀번호인증 페이지로 가는곳
		
		String mode = request.getParameter("mode");
		
		//System.out.println(mode);
		
		request.setAttribute("mode", mode);
		
		return "/mypage/infoCheckPage";
	}
	

	@RequestMapping(value="/infoCheckPage_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String cancelCheckStep1(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//탈퇴버튼 클릭후 나오는 본인확인을 위한 인증 컨트롤러
		
		System.out.println("infoCheckPage_ok.action 들어옴---------------------------------------");
		
		HttpSession session = request.getSession();
		
		String mode = request.getParameter("mode");
		
		System.out.println(mode);
		
		if(mode.equals(null)||mode==""){
			return "/mypage/myPageMain";
		}
		
		String M_PW = dto.getM_PW();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		
		String session_PW = vo.getM_PW();
		
		//System.out.println(M_PW);
		//System.out.println(session_PW);
		
		if(M_PW!=session_PW && !M_PW.equals(session_PW)) {
			
			String msg = "비밀번호가 틀립니다.";
			
			request.setAttribute("msg", msg);
			
			//System.out.println(request.getAttribute("msg"));
			
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
		
		if(session.getAttribute("userInfo")==null) {
			
			System.out.println("세션이 널이라 돌아간다 나중엔 인터셉터로");
			
			return "home";
		}
		
		return "/mypage/ChangeInfo";
	}
	
	@RequestMapping(value="/chanegeInfo_check_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String chanegeInfo_check_ok(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		//개인 정보 변경 들어가기전 본인 인증 단계

		System.out.println("개인정보확인컨트롤러ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ");
		
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
		
		return "/mypage/changInfoAuthorization";
	}
	
	@RequestMapping(value="/changeInfo_ok.action", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView chanegeInfo_ok(MemberDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//System.out.println("====================================_ok 탄다===============================================");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		MemberDTO vo = (MemberDTO) session.getAttribute("userInfo");
		
		String M_ID = vo.getM_ID();
		//String M_PW = vo.getM_PW();
		
		/*
		if(M_PW!=dto.getM_PW() && !M_PW.equals(dto.getM_PW())) {
			
			String msg = "비밀번호가 틀립니다.";
			
			mav.addObject("msg", msg);
			mav.setViewName("/mypage/ChangeInfo");
			
			//System.out.println(request.getAttribute("msg"));
			
			return mav;
		}
		*/
		
		//System.out.println(M_ID);
		//System.out.println(M_PW);
		
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
		
		service.updateInfo(hMap);
		
		session.removeAttribute("userInfo");
		
		//System.out.println("======================================세션삭제까지 끝났다=================================");
		
		MemberDTO vo1 = service.userInfo(M_ID);
		
		session.setAttribute("userInfo", vo1);
		
		mav.setViewName("loginTest");
		
		return mav;
	}
	
	@RequestMapping(value="/chanege_check.action", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String chanegeInfo_pwck(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//System.out.println("ajax 탄다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String pw = request.getParameter("pw");
		
		System.out.println(pw);
		
		if(pw!=dto.getM_PW() && !pw.equals(dto.getM_PW())) {
			
			String msg = "비밀번호가 틀립니다.";
			
			//System.out.println(request.getAttribute("msg"));
			
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
	
	@RequestMapping(value="/testAjax.action", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public boolean testAjax(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		System.out.println("1111111111111111111111111111111111111111탔다 아작스111111111111111111111111");
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
		
		String userPw = dto.getM_PW();
		String inputPw = (String)request.getParameter("pw");
		
		System.out.println(userPw);
		System.out.println(inputPw);
		
		if(userPw!=inputPw&&!userPw.equals(inputPw)) {
			return false;
		}
		
		return true;
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }
	
	
}
