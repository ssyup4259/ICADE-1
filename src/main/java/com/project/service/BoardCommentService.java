package com.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.BoardCommentDTO;

public interface BoardCommentService {
	
	//댓글등록
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req,HttpServletRequest request) throws Exception;
	//댓글 리스트
	public HttpServletRequest replyList(HttpServletRequest req) throws Exception;
	//상품 한개의 정보
	public BoardCommentDTO getReadReply(int bc_num) throws Exception;
	//댓글 업데이트
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request) throws Exception;
	//댓글 삭제
	public void deleteData(int BC_NUM, String path) throws Exception; 
}
