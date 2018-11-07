package com.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
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

import com.project.dao.AdminDAO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.WishDTO;
import com.project.service.LoginService;
import com.project.service.WishService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService l_service;
	
	@Autowired
	AdminDAO a_dao;
	
	@Autowired
	WishService w_service;
	
	@RequestMapping(value="/login.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		return "login/login";
	}
	
	@RequestMapping(value="/login_ok.action", method=RequestMethod.POST)
	public String login_ok(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String M_ID = req.getParameter("M_ID");
		String M_PW = req.getParameter("M_PW");
		
		HttpSession session = req.getSession();
		MemberDTO dto = l_service.checkInfo(M_ID);
		
		if(dto==null || dto.equals(null)) {
			
			String msg = "아이디가 없습니다";
			
			req.setAttribute("msg", msg);
			
			return "login/login";
		
		} else if(dto.getM_PW()!=M_PW && !dto.getM_PW().equals(M_PW)){
			
			String msg = "비밀번호가 틀립니다.";
			
			req.setAttribute("msg", msg);
			
			return "login/login";
			
		} else {
			List<WishDTO> lists =new ArrayList<WishDTO>();
			
			lists =  w_service.selectWish(M_ID);
			dto.setM_DATE(dto.getM_DATE().substring(0, 10));
			
			session.setAttribute("userInfo", dto);
			session.setAttribute("wishInfo", lists);
			System.out.println("---------------------------");
			
			
			return "redirect:/";
		}
		
		
	}
	
	@RequestMapping(value="/loginTest", method= {RequestMethod.GET,RequestMethod.POST})
	public String loginTest(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "loginTest";
	}
	
	@RequestMapping(value="/callbackTest", method= {RequestMethod.GET,RequestMethod.POST})
	public String callbackTest(MemberDTO dto, HttpServletRequest request, HttpServletResponse resp)throws Exception{
		
		System.out.println("===================================callbackTest============================");
		
		String clientId = "dnvfDSWWZdZLlC4W0n7E";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "XlytwRog6g";//애플리케이션 클라이언트 시크릿값";
		
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8080/icade/callbackTest", "UTF-8");
		String apiURL;
		
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&;";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		
		System.out.println("apiURL="+apiURL);
		
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			
			System.out.print("responseCode="+responseCode);
			System.out.println();
			
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer res = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
				br.close();
			if(responseCode==200) {
				System.out.println("res : " + res.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		
		return "callbackTest";
	}
	
	
	@RequestMapping(value="/logout.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userInfo");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/find/idFind.action", method= {RequestMethod.GET})
	public String idFindForm(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "login/idFind";
		
	}
	
	@RequestMapping(value="/find/idFind.action", method= {RequestMethod.POST})
	@ResponseBody
	public String idFind(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String result = l_service.idFind(m_dto);
		
		return result;
		
	}
	
	@RequestMapping(value="/find/pwdFind.action", method= {RequestMethod.GET})
	public String pwdFindForm(MemberDTO dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		return "login/pwdFind";
		
	}
	
	@RequestMapping(value="/find/pwdFind.action", method= {RequestMethod.POST})
	@ResponseBody
	public String pwdFind(MemberDTO m_dto, HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		String result = l_service.pwdFind(m_dto);
		
		return result;
		
	}
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
