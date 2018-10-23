package com.project.dao;

import java.util.List;


import com.project.dto.BoardCommentDTO;

public interface BoardCommentDAO {
	
	//댓글입력
	public int insertData(BoardCommentDTO bc_dto) throws Exception;
	//댓글 리스트
	public List<BoardCommentDTO> getReadData(String BC_ID) throws Exception; 
	//댓글 수정
	public void updateData(BoardCommentDTO bc_dto) throws Exception;
	//댓글 삭제
	public void deleteData(int BC_NUM,String path) throws Exception;
	
	
}
