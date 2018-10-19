package com.project.service;

import com.project.dto.MemberDTO;

public interface LoginService {

	public MemberDTO checkInfo(String M_ID) throws Exception;
	
}
