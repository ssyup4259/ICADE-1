package com.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.GoodsDetailDTO;
import com.project.dto.OrderDetailDTO;
import com.project.dto.OrdersDTO;

@Repository
public class BuyDAOImpl implements BuyDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String buyMapper = "com.project.mybatis.buyMapper";

	//상품 코드로 상품 정보 읽어오기
	@Override
	public GoodsDetailDTO getReadGoodsDetail(String gd_code) throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".getReadGoodsDetail", gd_code);
	}

	//결제 후 상세상품 재고 감소
	@Override
	public void goodsDetailCountDown(Map<String, Object> map) throws Exception {
		sessionTemplate.update(buyMapper + ".goodsDetailCountDown", map);
	}

	//결제 후 상세상품 재고 증가 
	@Override
	public void goodsDetailCountUp(Map<String, Object> map) throws Exception {
		sessionTemplate.update(buyMapper + ".goodsDetailCountUp", map);
	}
	
	@Override
	public int ordersMaxNum() throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".ordersMaxNum");
	}

	@Override
	public void insertOrders(Map<String, Object> map) throws Exception {
		sessionTemplate.insert(buyMapper + ".insertOrders", map);
		
	}

	@Override
	public void insertOrderDetail(Map<String, Object> map) throws Exception {
		sessionTemplate.insert(buyMapper + ".insertOrderDetail", map);
	}
	
	//상품 코드로 상품 정보 읽어오기(오버로딩)
	@Override
	public GoodsDetailDTO getReadGoodsDetail(Map<String, Object> map) throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".getReadGoodsDetailMap", map);
	}

	//포인트 감소
	@Override
	public void pointMinus(Map<String, Object> map) throws Exception {
		sessionTemplate.update(buyMapper + ".pointMinus", map);
	}

	//포인트 증가
	@Override
	public void pointAdd(Map<String, Object> map) throws Exception {
		sessionTemplate.update(buyMapper + ".pointAdd", map);
	}

	//환불 후 배송상태 변경
	@Override
	public void updateStatus(String o_num) throws Exception {
		sessionTemplate.update(buyMapper + ".updateStatus", o_num);
	}

	//주문 상세 내역 조회
	@Override
	public List<OrderDetailDTO> getReadOrderDetail(String o_num) throws Exception {
		return sessionTemplate.selectList(buyMapper + ".getReadOrderDetail", o_num);
	}

	//주문 내역 조회
	@Override
	public OrdersDTO getReadOrders(String o_num) throws Exception {
		return sessionTemplate.selectOne(buyMapper + ".getReadOrders", o_num);
	}

	//구매 후 장바구니 비우기
	@Override
	public void deleteCartItems(String cnum) throws Exception {
		sessionTemplate.delete(buyMapper + ".deleteCartItems", cnum);
	}

}
