package com.project.dto;

public class GoodsDTO {
	
	// 글 번호 게시글 글번호
    private int gNum;

    // 상품 이름 상품명
    private String gName;

    // 전체 상품 수량 
    private int gCount;

    // 상품 가격 소매가
    private int gPrice;

    // 판매한 개수 판매한상품개수
    private int gSellcount;

    // 상품설명 상품에대한 판매자의 코멘트
    private String gContent;

    // 할인율 상품에 대한 할인율
    private int gDiscount;

    // 상품 사진 
    private String gPhoto;
    
	public int getgNum() {
		return gNum;
	}

	public void setgNum(int gNum) {
		this.gNum = gNum;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgCount() {
		return gCount;
	}

	public void setgCount(int gCount) {
		this.gCount = gCount;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public int getgSellcount() {
		return gSellcount;
	}

	public void setgSellcount(int gSellcount) {
		this.gSellcount = gSellcount;
	}

	public String getgContent() {
		return gContent;
	}

	public void setgContent(String gContent) {
		this.gContent = gContent;
	}

	public int getgDiscount() {
		return gDiscount;
	}

	public void setgDiscount(int gDiscount) {
		this.gDiscount = gDiscount;
	}

	public String getgPhoto() {
		return gPhoto;
	}

	public void setgPhoto(String gPhoto) {
		this.gPhoto = gPhoto;
	}
    
}
