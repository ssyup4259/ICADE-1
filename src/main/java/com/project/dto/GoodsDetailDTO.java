package com.project.dto;

public class GoodsDetailDTO {
	
	 // 상품번호
    private int GD_NUM;

    // 상품 코드
    private String GD_CODE;

    // 상품 종류번호
    private int GD_KIND_NUM;

    // 지원 기종 
    private int GD_DEVICE;

    // 색상 코드 
    private int GD_COLOR;

    // 상품 수량 
    private int GD_COUNT;

    // 판매한 개수
    private int GD_SELLCOUNT;
    
    // 기종 이름
    private String DK_NAME;
    
    // 상품 색상
    private String GC_COLOR;

	public int getGD_NUM() {
		return GD_NUM;
	}

	public void setGD_NUM(int gD_NUM) {
		GD_NUM = gD_NUM;
	}

	public String getGD_CODE() {
		return GD_CODE;
	}

	public void setGD_CODE(String gD_CODE) {
		GD_CODE = gD_CODE;
	}

	public int getGD_KIND_NUM() {
		return GD_KIND_NUM;
	}

	public void setGD_KIND_NUM(int gD_KIND_NUM) {
		GD_KIND_NUM = gD_KIND_NUM;
	}

	public int getGD_DEVICE() {
		return GD_DEVICE;
	}

	public void setGD_DEVICE(int gD_DEVICE) {
		GD_DEVICE = gD_DEVICE;
	}

	public int getGD_COLOR() {
		return GD_COLOR;
	}

	public void setGD_COLOR(int gD_COLOR) {
		GD_COLOR = gD_COLOR;
	}

	public int getGD_COUNT() {
		return GD_COUNT;
	}

	public void setGD_COUNT(int gD_COUNT) {
		GD_COUNT = gD_COUNT;
	}

	public int getGD_SELLCOUNT() {
		return GD_SELLCOUNT;
	}

	public void setGD_SELLCOUNT(int gD_SELLCOUNT) {
		GD_SELLCOUNT = gD_SELLCOUNT;
	}

	public String getDK_NAME() {
		return DK_NAME;
	}

	public void setDK_NAME(String dK_NAME) {
		DK_NAME = dK_NAME;
	}

	public String getGC_COLOR() {
		return GC_COLOR;
	}

	public void setGC_COLOR(String gC_COLOR) {
		GC_COLOR = gC_COLOR;
	}
    
}
