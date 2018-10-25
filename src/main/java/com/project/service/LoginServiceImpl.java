package com.project.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.LoginDAO;
import com.project.dto.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO l_dao;
	
	@Override
	public MemberDTO checkInfo(String M_ID) throws Exception {
		return l_dao.checkInfo(M_ID);
	}

	//ID 찾기
	@Override
	public String idFind(MemberDTO m_dto) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", m_dto.getM_NAME());
		map.put("email", m_dto.getM_EMAIL_ID());
		map.put("domain", m_dto.getM_EMAIL_DOMAIN());
		map.put("phone1", m_dto.getM_CELLPHONE1());
		map.put("phone2", m_dto.getM_CELLPHONE2());
		map.put("phone3", m_dto.getM_CELLPHONE3());
		
		String result = l_dao.idFind(map);
		
		if (result == null || result.equals("")) { //ID가 존재하지 않음
			return null;
		}
		
		return result;
	}

}
