package com.project.dto;

import org.springframework.web.multipart.MultipartFile;

public class GoodsDTO {
	
	// 글 번호 게시글 글번호
    private int G_NUM;

    // 상품 이름 상품명
    private String G_NAME;

    // 전체 상품 수량 
    private int G_COUNT;

    // 상품 가격 소매가
    private int G_PRICE;

    // 판매한 개수 판매한상품개수
    private int G_SELLCOUNT;

    // 상품설명 상품에대한 판매자의 코멘트
    private String G_CONTENT;

    // 할인율 상품에 대한 할인율
    private String G_DISCOUNT;

    // 파일
    private MultipartFile gFile;
    
	// 상품 설명 파일
    private MultipartFile gFile2;

	// 상품 사진명 
    private String G_PHOTO;
    
    // 상품 사진 저장명
    private String G_SAVEFILENAME;
    
    // 상품 종류번호
    private int GD_KIND_NUM;
    
    // 상품 종류
    private String GK_KIND;
    
    // 상품 내용 이미지 원본 파일명
    private String G_CONTENT_ORIGINAL_FILE;
    
    // 상품 내용 이미지 저장 파일명
    private String G_CONTENT_SAVE_FILE;
    
    public MultipartFile getgFile2() {
		return gFile2;
	}

	public void setgFile2(MultipartFile gFile2) {
		this.gFile2 = gFile2;
	}

	public String getG_CONTENT_ORIGINAL_FILE() {
		return G_CONTENT_ORIGINAL_FILE;
	}

	public void setG_CONTENT_ORIGINAL_FILE(String g_CONTENT_ORIGINAL_FILE) {
		G_CONTENT_ORIGINAL_FILE = g_CONTENT_ORIGINAL_FILE;
	}

	public String getG_CONTENT_SAVE_FILE() {
		return G_CONTENT_SAVE_FILE;
	}

	public void setG_CONTENT_SAVE_FILE(String g_CONTENT_SAVE_FILE) {
		G_CONTENT_SAVE_FILE = g_CONTENT_SAVE_FILE;
	}

	public int getGD_KIND_NUM() {
		return GD_KIND_NUM;
	}

	public void setGD_KIND_NUM(int gD_KIND_NUM) {
		GD_KIND_NUM = gD_KIND_NUM;
	}

	public String getGK_KIND() {
		return GK_KIND;
	}

	public void setGK_KIND(String gK_KIND) {
		GK_KIND = gK_KIND;
	}

	public int getG_NUM() {
		return G_NUM;
	}

	public void setG_NUM(int g_NUM) {
		G_NUM = g_NUM;
	}

	public String getG_NAME() {
		return G_NAME;
	}

	public void setG_NAME(String g_NAME) {
		G_NAME = g_NAME;
	}

	public int getG_COUNT() {
		return G_COUNT;
	}

	public void setG_COUNT(int g_COUNT) {
		G_COUNT = g_COUNT;
	}

	public int getG_PRICE() {
		return G_PRICE;
	}

	public void setG_PRICE(int g_PRICE) {
		G_PRICE = g_PRICE;
	}

	public int getG_SELLCOUNT() {
		return G_SELLCOUNT;
	}

	public void setG_SELLCOUNT(int g_SELLCOUNT) {
		G_SELLCOUNT = g_SELLCOUNT;
	}

	public String getG_CONTENT() {
		return G_CONTENT;
	}

	public void setG_CONTENT(String g_CONTENT) {
		G_CONTENT = g_CONTENT;
	}

	public String getG_DISCOUNT() {
		return G_DISCOUNT;
	}

	public void setG_DISCOUNT(String g_DISCOUNT) {
		G_DISCOUNT = g_DISCOUNT;
	}

	public MultipartFile getgFile() {
		return gFile;
	}

	public void setgFile(MultipartFile gFile) {
		this.gFile = gFile;
	}

	public String getG_PHOTO() {
		return G_PHOTO;
	}

	public void setG_PHOTO(String g_PHOTO) {
		G_PHOTO = g_PHOTO;
	}

	public String getG_SAVEFILENAME() {
		return G_SAVEFILENAME;
	}

	public void setG_SAVEFILENAME(String g_SAVEFILENAME) {
		G_SAVEFILENAME = g_SAVEFILENAME;
	}
    
}
