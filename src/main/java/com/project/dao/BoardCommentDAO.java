package com.project.dao;


import java.util.List;

import com.project.dto.BoardCommentDTO;
import com.project.dto.GoodsDTO;

public interface BoardCommentDAO {
	
	//댓글입력
	public int insertData(BoardCommentDTO bc_dto) throws Exception;
	//댓글 개수 구하기
	public int countReply(int BC_BOARD)throws Exception;
	//댓글 리스트
	public List<BoardCommentDTO> replyList(int start,int end, int BC_BOARD ) throws Exception; 
	//댓글 하나의 데이터 읽어오기
	public BoardCommentDTO getReadData(int bc_num)throws Exception;
	//댓글 수정
	public void updateData(BoardCommentDTO bc_dto) throws Exception;
	//댓글 삭제
	public void deleteData(int BC_NUM,String path) throws Exception;
	//전체 댓글 리스트
	public List<BoardCommentDTO> replyAllList(int start,int end) throws Exception;
	//전체 댓글 갯수
	public int countAllReply()throws Exception;
	//포토후기 작성시 상품 정보 읽어오기 및 검색
	public List<BoardCommentDTO> searchGoodsList(String searchKey, String searchValue)throws Exception;
	//하나의 댓글에 담긴 상품 정보
	public BoardCommentDTO getReadOne(int bc_num)throws Exception;
	//이전글 다음글 설정하기
	public BoardCommentDTO readSubject(int bc_num)throws Exception;
	//대댓글 리스트
	public List<BoardCommentDTO> readReply(int BC_NUM)throws Exception;
	//파일없는 댓글 삭제
	public void deleteReply(int BC_NUM)throws Exception;
	
}
