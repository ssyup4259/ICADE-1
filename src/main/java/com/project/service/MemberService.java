package com.project.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.dto.MemberDTO;
import com.project.service.MailHandler;
import com.project.service.TempKey;




@Repository
public class MemberService {
	@Inject
	private JavaMailSender mailSender;
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	@Transactional
	public void insertData(MemberDTO dto) throws Exception {
		sessionTemplate.insert("joinMapper.insertData", dto);
		
		String key = new TempKey().getKey(50,false);
		
		sessionTemplate.update("joinMapper.createAuthkey", key);
		
		MailHandler sendMail = new MailHandler(mailSender);
		
		sendMail.setSubject("[이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://192.168.16.19:8080/icade/emailConfirm?user_email=").append(dto.getMEmailId()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("호스트 이메일 아이디", "관리자");
		sendMail.setTo(dto.getMEmailId());
		sendMail.send();
		
	}
	public void userAuth(String mEmailId) throws Exception {
		sessionTemplate.update(mEmailId);
	}
	
}
