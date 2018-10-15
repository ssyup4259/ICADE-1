package com.project.service;

public interface MailService {

	/**
	 * 메일 전송
	 * @param subject : 제목
	 * @param text : 내용
	 * @param from : from 보내는 메일주소
	 * @param to :받는 메일 주소
	 * @param filePath : 첨부파일 없을 시 null
	 * @return
	 */
	//이메일 발송
	boolean send(String subject, String text, String from, String to, String filePath);


}
