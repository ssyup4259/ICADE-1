package com.project.dto;

import org.springframework.web.multipart.MultipartFile;

public class BoardCommentDTO {
	
	private int BC_NUM;
	private int BC_BOARD;
	private int BC_DATE;
	private int BC_PARENT;
	
	
	private String BC_ID;
	private String BC_CONTENT;
	private String BC_IMAGE;
	
	private MultipartFile gFile;
	
	
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
	public int getBC_DATE() {
		return BC_DATE;
	}
	public void setBC_DATE(int bC_DATE) {
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
	public MultipartFile getgFile() {
		return gFile;
	}
	public void setgFile(MultipartFile gFile) {
		this.gFile = gFile;
	}
	
	
	
	

}
