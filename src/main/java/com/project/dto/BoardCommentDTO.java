package com.project.dto;

import org.springframework.web.multipart.MultipartFile;
import oracle.sql.DATE;

public class BoardCommentDTO {
	
	//글번호
	private int BC_NUM;
	//글 게시판
	private int BC_BOARD;
	//작성날짜
	private DATE BC_DATE;
	//작성 게시판
	private int BC_PARENT;
	
	//작성 아이디
	private String BC_ID;
	//작성 내용
	private String BC_CONTENT;
	//사진
	private String BC_IMAGE;
	//파일
	private MultipartFile bcFile;
	//파일 저장명
	private String BC_SAVEFILENAME;
	// 댓글- 답변글 깊이
    private int Level;
	
	
	public int getBC_NUM() {
		return BC_NUM;
	}
	public void setBC_NUM(int bC_NUM) {
		BC_NUM = bC_NUM;
	}
	public int getBC_BOARD() {
		return BC_BOARD;
	}
	public void setBC_BOARD(int bC_BOARD) {
		BC_BOARD = bC_BOARD;
	}
	public DATE getBC_DATE() {
		return BC_DATE;
	}
	public void setBC_DATE(DATE bC_DATE) {
		BC_DATE = bC_DATE;
	}
	public int getBC_PARENT() {
		return BC_PARENT;
	}
	public void setBC_PARENT(int bC_PARENT) {
		BC_PARENT = bC_PARENT;
	}
	public String getBC_ID() {
		return BC_ID;
	}
	public void setBC_ID(String bC_ID) {
		BC_ID = bC_ID;
	}
	public String getBC_CONTENT() {
		return BC_CONTENT;
	}
	public void setBC_CONTENT(String bC_CONTENT) {
		BC_CONTENT = bC_CONTENT;
	}
	public String getBC_IMAGE() {
		return BC_IMAGE;
	}
	public void setBC_IMAGE(String bC_IMAGE) {
		BC_IMAGE = bC_IMAGE;
	}
	public MultipartFile getBcFile() {
		return bcFile;
	}
	public void setBcFile(MultipartFile bcFile) {
		this.bcFile = bcFile;
	}

	public String getBC_SAVEFILENAME() {
		return BC_SAVEFILENAME;
	}
	public void setBC_SAVEFILENAME(String bC_SAVEFILENAME) {
		BC_SAVEFILENAME = bC_SAVEFILENAME;
	}
	public int getLevel() {
		return Level;
	}
	public void setLevel(int level) {
		Level = level;
	}
	
	
	
	

}
