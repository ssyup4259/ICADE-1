package com.project.service;

public interface MailService {

	
	
	
	
	//이메일 발송
	boolean send(String subject, String text, String from, String to);


}
