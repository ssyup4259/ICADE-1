package com.project.dao;

import com.project.dto.MemberDTO;

public interface LoginDAO {
	
	public MemberDTO checkInfo(String M_ID) throws Exception;
}
