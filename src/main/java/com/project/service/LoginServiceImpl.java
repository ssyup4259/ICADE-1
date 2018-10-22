package com.project.service;

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

}
