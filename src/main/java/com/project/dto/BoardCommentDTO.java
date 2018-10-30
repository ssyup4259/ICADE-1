package com.project.dto;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommentDTO {

	// 글번호
	private int BC_NUM;
	// 글 게시판
	private int BC_BOARD;
	// 작성날짜
	private String BC_DATE;
	// 작성 게시판
	private int BC_PARENT;
	// 작성 아이디
	private String BC_ID;
	//댓글 제목
	private String BC_SUBJECT;
	// 작성 내용
	private String BC_CONTENT;
	// 사진 파일 명
	private String BC_IMAGE;
	// 파일 저장명
	private String BC_SAVEFILENAME;
	// 파일
	private MultipartFile bcfile;

//------------컨텐츠 사진들---------------------
	private String BC_CONTENTFILE1;
	private String BC_CONTENTFILE2;
	private String BC_CONTENTFILE3;

	private String BC_SAVE1;
	private String BC_SAVE2;
	private String BC_SAVE3;

	private MultipartFile bcfile1;
	private MultipartFile bcfile2;
	private MultipartFile bcfile3;
//------------컨텐츠 사진들---------------------
	
	
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

	public String getBC_DATE() {
		return BC_DATE;
	}

	public void setBC_DATE(String bC_DATE) {
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

	public String getBC_SUBJECT() {
		return BC_SUBJECT;
	}

	public void setBC_SUBJECT(String bC_SUBJECT) {
		BC_SUBJECT = bC_SUBJECT;
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

	public String getBC_CONTENTFILE1() {
		return BC_CONTENTFILE1;
	}

	public void setBC_CONTENTFILE1(String bC_CONTENTFILE1) {
		BC_CONTENTFILE1 = bC_CONTENTFILE1;
	}

	public String getBC_CONTENTFILE2() {
		return BC_CONTENTFILE2;
	}

	public void setBC_CONTENTFILE2(String bC_CONTENTFILE2) {
		BC_CONTENTFILE2 = bC_CONTENTFILE2;
	}

	public String getBC_CONTENTFILE3() {
		return BC_CONTENTFILE3;
	}

	public void setBC_CONTENTFILE3(String bC_CONTENTFILE3) {
		BC_CONTENTFILE3 = bC_CONTENTFILE3;
	}

	public String getBC_SAVE1() {
		return BC_SAVE1;
	}

	public void setBC_SAVE1(String bC_SAVE1) {
		BC_SAVE1 = bC_SAVE1;
	}

	public String getBC_SAVE2() {
		return BC_SAVE2;
	}

	public void setBC_SAVE2(String bC_SAVE2) {
		BC_SAVE2 = bC_SAVE2;
	}

	public String getBC_SAVE3() {
		return BC_SAVE3;
	}

	public void setBC_SAVE3(String bC_SAVE3) {
		BC_SAVE3 = bC_SAVE3;
	}

	public MultipartFile getBcfile() {
		return bcfile;
	}

	public void setBcfile(MultipartFile bcfile) {
		this.bcfile = bcfile;
	}

	public MultipartFile getBcfile1() {
		return bcfile1;
	}

	public void setBcfile1(MultipartFile bcfile1) {
		this.bcfile1 = bcfile1;
	}

	public MultipartFile getBcfile2() {
		return bcfile2;
	}

	public void setBcfile2(MultipartFile bcfile2) {
		this.bcfile2 = bcfile2;
	}

	public MultipartFile getBcfile3() {
		return bcfile3;
	}

	public void setBcfile3(MultipartFile bcfile3) {
		this.bcfile3 = bcfile3;
	}
}
