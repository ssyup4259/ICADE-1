package com.project.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import com.project.service.MailService;
import com.project.service.MemberServiceImpl;
@Controller
public class MemberController {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Autowired
	private MailService mailService;
	
	
	@RequestMapping(value="/checkMail", produces="application/text; charset=utf8")
	private String checkMail(@requ)
	
	

}
