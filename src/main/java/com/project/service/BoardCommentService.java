package com.project.service;

import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.BoardCommentDTO;

public interface BoardCommentService {
	
	//댓글등록
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req) throws Exception;
	//댓글 리스트
	public List<BoardCommentDTO> replyList(HttpServletRequest req) throws Exception;
	//상품 한개의 정보
	public BoardCommentDTO getReadReply(int bc_num) throws Exception;
	//댓글 업데이트
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req) throws Exception;
	//댓글 삭제
	public void deleteData(int BC_NUM, String path) throws Exception; 
}
