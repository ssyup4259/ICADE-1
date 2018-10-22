package com.project.dto;

public class CartDTO {
	
	private int C_NUM;
	private int C_GNUM;
	private String C_CODE;
	private String C_ID;
	private String C_NAME;
	private String C_COLOR;
	private String C_DEVICE;
	private String C_SAVEFILENAME;
	private int C_PRICE;
	private int C_COUNT;
	
	
	
	public int getC_PRICE() {
		return C_PRICE;
	}
	public void setC_PRICE(int c_PRICE) {
		C_PRICE = c_PRICE;
	}
	public String getC_SAVEFILENAME() {
		return C_SAVEFILENAME;
	}
	public void setC_SAVEFILENAME(String c_SAVEFILENAME) {
		C_SAVEFILENAME = c_SAVEFILENAME;
	}
	public String getC_COLOR() {
		return C_COLOR;
	}
	public void setC_COLOR(String c_COLOR) {
		C_COLOR = c_COLOR;
	}
	public String getC_DEVICE() {
		return C_DEVICE;
	}
	public void setC_DEVICE(String c_DEVICE) {
		C_DEVICE = c_DEVICE;
	}
	public int getC_GNUM() {
		return C_GNUM;
	}
	public void setC_GNUM(int c_GNUM) {
		C_GNUM = c_GNUM;
	}
	public int getC_NUM() {
		return C_NUM;
	}
	public void setC_NUM(int c_NUM) {
		C_NUM = c_NUM;
	}
	public String getC_CODE() {
		return C_CODE;
	}
	public void setC_CODE(String c_CODE) {
		C_CODE = c_CODE;
	}
	public String getC_ID() {
		return C_ID;
	}
	public void setC_ID(String c_ID) {
		C_ID = c_ID;
	}
	public String getC_NAME() {
		return C_NAME;
	}
	public void setC_NAME(String c_NAME) {
		C_NAME = c_NAME;
	}
	public int getC_COUNT() {
		return C_COUNT;
	}
	public void setC_COUNT(int c_COUNT) {
		C_COUNT = c_COUNT;
	}
	
}
