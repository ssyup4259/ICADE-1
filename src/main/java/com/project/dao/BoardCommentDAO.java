package com.project.dao;

import java.util.List;import java.util.Map;

import com.project.dto.BoardCommentDTO;

public interface BoardCommentDAO {
	
	//댓글입력
	public int insertData(BoardCommentDTO bc_dto) throws Exception;
	//댓글 리스트
	public List<BoardCommentDTO> replyList(String BC_ID) throws Exception; 
	//댓글 하나의 데이터 읽어오기
	public BoardCommentDTO getReadData(int bc_num)throws Exception;
	//댓글 수정
	public void updateData(BoardCommentDTO bc_dto) throws Exception;
	//댓글 삭제
	public void deleteData(int BC_NUM,String path) throws Exception;
	
	
}
