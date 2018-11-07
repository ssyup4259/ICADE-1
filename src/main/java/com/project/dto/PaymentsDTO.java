package com.project.dto;

public class PaymentsDTO {
	
	//아임포트 결제 고유 UID (string 32)
	private String imp_uid;
	
	//(string 20, optional): samsung : 삼성페이 / card : 신용카드 / trans : 계좌이체 / vbank : 가상계좌
	private String pay_method;
	
	//(string, optional): 결제가 발생된 경로. pc:(인증방식)PC결제, mobile:(인증방식)모바일결제, api:정기결제 또는 비인증방식결제 = ['pc', 'mobile', 'api']
	private String channel;
	
	//(string 16, optional): PG사 명칭. inicis(이니시스) / nice(나이스정보통신)
	private String pg_provider;
	
	//(string 40, optional): 주문명칭
	private String name;
	
	//(number): 주문(결제)금액
	private int amount;
	
	//(number): 결제취소금액
	private int cancel_amount;
	
	//(string 16, optional): 주문자명
	private String buyer_name;
	
	//(string 64, optional): 주문자 Email주소
	private String buyer_email;
	
	//(string 16, optional): 주문자 전화번호
	private String buyer_tel;
	
	//(string 128, optional): 주문자 주소
	private String buyer_addr;
	
	//(string 8, optional): 주문자 우편번호
	private String buyer_postcode;
	
	//(string): 결제상태. ready:미결제, paid:결제완료, cancelled:결제취소, failed:결제실패 = ['ready', 'paid', 'cancelled', 'failed']
	private String status;
	
	//(integer, optional): 결제완료시점 UNIX timestamp. 결제완료가 아닐 경우 0
	private String paid_at;
	
	//(integer, optional): 결제취소시점 UNIX timestamp. 결제취소가 아닐 경우 0
	private String cancelled_at;
	
	//카드사 명칭
	private String card_name;
	
	//할부 개월 수 0이면 일시불
	private int card_quota;
	
	//구매자 ID
	private String m_id;
	
	//구매자 이름
	private String m_name;
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public int getCard_quota() {
		return card_quota;
	}

	public void setCard_quota(int card_quota) {
		this.card_quota = card_quota;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getPg_provider() {
		return pg_provider;
	}

	public void setPg_provider(String pg_provider) {
		this.pg_provider = pg_provider;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCancel_amount() {
		return cancel_amount;
	}

	public void setCancel_amount(int cancel_amount) {
		this.cancel_amount = cancel_amount;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getBuyer_addr() {
		return buyer_addr;
	}

	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}

	public String getBuyer_postcode() {
		return buyer_postcode;
	}

	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaid_at() {
		return paid_at;
	}

	public void setPaid_at(String paid_at) {
		this.paid_at = paid_at;
	}

	public String getCancelled_at() {
		return cancelled_at;
	}

	public void setCancelled_at(String cancelled_at) {
		this.cancelled_at = cancelled_at;
	}

}
