package com.project.dto;

public class OrderHistoryDTO {
	
	//주문번호
	private int O_NUM;
	//주문 날짜
	private String O_DATE;
	//배송상태
	private String O_STATUS;
	//결제수단
	private String O_WAY;
	//결제 총 금액
	private int O_TOT;
	//운송장 번호
	private int O_TNUM;
	//환불코드?
	private String O_IMP;
	//상품코드
	private String OD_CODE;
	//주문 상품명
	private String OD_NAME;
	//지원 기종
	private String OD_DEVICE;
	//색상
	private String OD_COLOR;
	//주문 수량
	private int OD_COUNT;
	//상품 가격
	private int OD_PRICE;
	//상품 할인률
	private int OD_DISCOUNT;
	//상품의 글번호
	private int GD_NUM;
	//상품의 저장된 이미지 이름
	private String G_SAVEFILENAME;
	
	public String getO_DATE() {
		return O_DATE;
	}
	public void setO_DATE(String o_DATE) {
		O_DATE = o_DATE;
	}
	public String getO_STATUS() {
		return O_STATUS;
	}
	public void setO_STATUS(String o_STATUS) {
		O_STATUS = o_STATUS;
	}
	public String getO_WAY() {
		return O_WAY;
	}
	public void setO_WAY(String o_WAY) {
		O_WAY = o_WAY;
	}
	public int getO_TOT() {
		return O_TOT;
	}
	public void setO_TOT(int o_TOT) {
		O_TOT = o_TOT;
	}
	public int getO_TNUM() {
		return O_TNUM;
	}
	public void setO_TNUM(int o_TNUM) {
		O_TNUM = o_TNUM;
	}
	public int getO_NUM() {
		return O_NUM;
	}
	public void setO_NUM(int o_NUM) {
		O_NUM = o_NUM;
	}
	public String getO_IMP() {
		return O_IMP;
	}
	public void setO_IMP(String o_IMP) {
		O_IMP = o_IMP;
	}
	public String getOD_CODE() {
		return OD_CODE;
	}
	public void setOD_CODE(String oD_CODE) {
		OD_CODE = oD_CODE;
	}
	public String getOD_NAME() {
		return OD_NAME;
	}
	public void setOD_NAME(String oD_NAME) {
		OD_NAME = oD_NAME;
	}
	public String getOD_DEVICE() {
		return OD_DEVICE;
	}
	public void setOD_DEVICE(String oD_DEVICE) {
		OD_DEVICE = oD_DEVICE;
	}
	public String getOD_COLOR() {
		return OD_COLOR;
	}
	public void setOD_COLOR(String oD_COLOR) {
		OD_COLOR = oD_COLOR;
	}
	public int getOD_COUNT() {
		return OD_COUNT;
	}
	public void setOD_COUNT(int oD_COUNT) {
		OD_COUNT = oD_COUNT;
	}
	public int getOD_PRICE() {
		return OD_PRICE;
	}
	public void setOD_PRICE(int oD_PRICE) {
		OD_PRICE = oD_PRICE;
	}
	public int getOD_DISCOUNT() {
		return OD_DISCOUNT;
	}
	public void setOD_DISCOUNT(int oD_DISCOUNT) {
		OD_DISCOUNT = oD_DISCOUNT;
	}
	public int getGD_NUM() {
		return GD_NUM;
	}
	public void setGD_NUM(int gD_NUM) {
		GD_NUM = gD_NUM;
	}
	public String getG_SAVEFILENAME() {
		return G_SAVEFILENAME;
	}
	public void setG_SAVEFILENAME(String g_SAVEFILENAME) {
		G_SAVEFILENAME = g_SAVEFILENAME;
	}

	
}
