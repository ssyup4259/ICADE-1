package com.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.BoardCommentDTO;
import com.project.dto.GoodsDTO;

public interface BoardCommentService {
	
	//포토후기등록
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req,HttpServletRequest request) throws Exception;
	//댓글 리스트
	public HttpServletRequest replyList(HttpServletRequest req) throws Exception;
	//댓글 한개의 정보
	public BoardCommentDTO getReadReply(int bc_num) throws Exception;
	//댓글 업데이트
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request) throws Exception;
	//댓글 삭제
	public void deleteData(int BC_NUM, String path) throws Exception;
	//전체 댓글 목록
	public HttpServletRequest replyAllList(HttpServletRequest req)throws Exception;
	//댓글 상세페이지
	public HttpServletRequest replyArticle(HttpServletRequest req)throws Exception;
	//대댓글 등록
	public HttpServletRequest replyComment(BoardCommentDTO bc_dto,HttpServletRequest req)throws Exception;
	//대댓글 리스트
	public HttpServletRequest replyCommentList(HttpServletRequest req)throws Exception;
	//대댓글 업데이트
	public void updateReply(BoardCommentDTO bc_dto, HttpServletRequest req)throws Exception;
	//사진없는 댓글 삭제
	public void deleteReply(int BC_NUM)throws Exception;
	//상품 검색하기
	public HttpServletRequest searchGoodsList(BoardCommentDTO bc_dto,HttpServletRequest req) throws Exception;
	
}
