package com.project.dto;

public class SupportCenterDTO {
	
	  // 글번호 
    private int SC_NUM;

    // 부모 글번호 
    private int SC_PARENT;

    // 작성자 아이디 
    private String SC_ID;

    // 상담 날짜 
    private String SC_DATE;

    // 상담 내용 
    private String SC_CONTENT;

    // 상담 내용 사진 
    private String SC_IMAGE;

    // 상담 내용 저장사진 
    private String SC_SAVEFILENAME;

    // 상담받는 고객이름 
    private String SC_NAME;

    // 관리자 확인용 
    private String SC_RANK;

    // 상담 완료 여부 체크 
    private String SC_STATUS;

    // 상담내역 주제 
    private String SC_SUBJECT;

	public int getSC_NUM() {
		return SC_NUM;
	}

	public void setSC_NUM(int sC_NUM) {
		SC_NUM = sC_NUM;
	}

	public int getSC_PARENT() {
		return SC_PARENT;
	}

	public void setSC_PARENT(int sC_PARENT) {
		SC_PARENT = sC_PARENT;
	}

	public String getSC_ID() {
		return SC_ID;
	}

	public void setSC_ID(String sC_ID) {
		SC_ID = sC_ID;
	}

	public String getSC_DATE() {
		return SC_DATE;
	}

	public void setSC_DATE(String sC_DATE) {
		SC_DATE = sC_DATE;
	}

	public String getSC_CONTENT() {
		return SC_CONTENT;
	}

	public void setSC_CONTENT(String sC_CONTENT) {
		SC_CONTENT = sC_CONTENT;
	}

	public String getSC_IMAGE() {
		return SC_IMAGE;
	}

	public void setSC_IMAGE(String sC_IMAGE) {
		SC_IMAGE = sC_IMAGE;
	}

	public String getSC_SAVEFILENAME() {
		return SC_SAVEFILENAME;
	}

	public void setSC_SAVEFILENAME(String sC_SAVEFILENAME) {
		SC_SAVEFILENAME = sC_SAVEFILENAME;
	}

	public String getSC_NAME() {
		return SC_NAME;
	}

	public void setSC_NAME(String sC_NAME) {
		SC_NAME = sC_NAME;
	}

	public String getSC_RANK() {
		return SC_RANK;
	}

	public void setSC_RANK(String sC_RANK) {
		SC_RANK = sC_RANK;
	}

	public String getSC_STATUS() {
		return SC_STATUS;
	}

	public void setSC_STATUS(String sC_STATUS) {
		SC_STATUS = sC_STATUS;
	}

	public String getSC_SUBJECT() {
		return SC_SUBJECT;
	}

	public void setSC_SUBJECT(String sC_SUBJECT) {
		SC_SUBJECT = sC_SUBJECT;
	}


}
