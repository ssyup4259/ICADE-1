package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.dto.NoticeDTO;

public interface NoticeService {

	public HttpServletRequest noticeList(HttpServletRequest req) throws Exception;

	public NoticeDTO getNoticeDetail(int BN_NUM) throws Exception;

	void noticeRegister(NoticeDTO n_dto) throws Exception;

	void updateNotice(HttpServletRequest req) throws Exception;
	
	void deleteNotice(int BN_NUM) throws Exception;

}
