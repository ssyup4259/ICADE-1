package com.project.dto;

public class GoodsDetailDTO {
	
	 // 상품번호
    private int gdNum;

    // 상품 코드
    private String gdCode;

    // 상품 종류번호
    private int gdKindNum;

    // 지원 기	종 
    private int gdDevice;

    // 색상 코드 
    private int gdColor;

    // 상품 수량 
    private int gdCount;

    // 판매한 개수
    private int gdSellcount;

	public int getGdNum() {
		return gdNum;
	}

	public void setGdNum(int gdNum) {
		this.gdNum = gdNum;
	}

	public String getGdCode() {
		return gdCode;
	}

	public void setGdCode(String gdCode) {
		this.gdCode = gdCode;
	}

	public int getGdKindNum() {
		return gdKindNum;
	}

	public void setGdKindNum(int gdKindNum) {
		this.gdKindNum = gdKindNum;
	}

	public int getGdDevice() {
		return gdDevice;
	}

	public void setGdDevice(int gdDevice) {
		this.gdDevice = gdDevice;
	}

	public int getGdColor() {
		return gdColor;
	}

	public void setGdColor(int gdColor) {
		this.gdColor = gdColor;
	}

	public int getGdCount() {
		return gdCount;
	}

	public void setGdCount(int gdCount) {
		this.gdCount = gdCount;
	}

	public int getGdSellcount() {
		return gdSellcount;
	}

	public void setGdSellcount(int gdSellcount) {
		this.gdSellcount = gdSellcount;
	}
    
}
