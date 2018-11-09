package com.project.dao;

import java.util.List;

import com.project.dto.SupportCenterDTO;

public interface SupportDAO {
	
	//상담글 등록
	public int insertData(SupportCenterDTO SC_DTO, int SC_NUM) throws Exception;
	//고객이 보는 답변 안된 상담글 리스트
	public List<SupportCenterDTO> nonMemberCommentList() throws Exception; 
	//고객이 보는 답변 완료된 상담글 리스트
	public List<SupportCenterDTO> memberCommentList() throws Exception; 
	//관리자가 보는 답변 안된 상담글 리스트
	public List<SupportCenterDTO> nonCommentList() throws Exception;
	//관리자가 보는 답변 완료된 상담글 리스트
	public List<SupportCenterDTO> completeCommentList() throws Exception;
	//하나의 글 읽어오기
	public SupportCenterDTO getReadData(int SC_NUM)throws Exception;
	//고객이 글 수정하기
	public void memberUpdateContent(SupportCenterDTO SC_DTO) throws Exception;
	//관리자가 글 수정하기
	public void adminUpdateContent(SupportCenterDTO SC_DTO) throws Exception;
	//이전글 다음글 설정하기
	public SupportCenterDTO readSubject(int SC_NUM)throws Exception;
	//글 삭제
	public void deleteData(int SC_NUM)throws Exception;	

}
