package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/buy/*")
public class BuyController {
	
	Logger log = LoggerFactory.getLogger(BuyController.class);
	
	
	//구매 화면
	@RequestMapping(value="/buyForm.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String buyForm(HttpServletRequest req) throws Exception {
		
		//세션에서 아이디를 받은 후 유저의 정보를 셋팅해서 같이 뿌려줘야함
		//단품(구매)이던 여러개(장바구니)던 상품의 정보들을 리스트에 넣어서 뿌려줘야함
		
		//구매화면에서 Ajax로 결제팝업을 띄우고 결제 완료시 구매화면을 다음화면(구매완료)로 넘기며 DB에 값 저장
		
		return "buy/buyForm";
		
	}

}
