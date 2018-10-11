package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO m_dao;

	@Override
	public void insertMember(MemberDTO m_dto) throws Exception {

		m_dao.insertMember(m_dto);

	}

	@Override
	public int idCheck(String M_ID) throws Exception {
		
		
		
		return m_dao.idCheck(M_ID);
		
	}

	@Override
	public int nickCheck(String M_NICKNAME) throws Exception {

		return m_dao.nickCheck(M_NICKNAME);
		
	}

}
