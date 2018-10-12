package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String namespace = "com.project.mybatis.adminMapper";
	
	@Override
	public List<GoodsKindDTO> getGoodsKindList() throws Exception {
		return sessionTemplate.selectList(namespace + ".getGoodsKind");
	}
	
	@Override
	public List<DeviceKindDTO> getDeviceList() throws Exception {
		return sessionTemplate.selectList(namespace + ".getDevice");
	}
	
	@Override
	public List<GoodsColorDTO> getColorList() throws Exception {
		return sessionTemplate.selectList(namespace + ".getColor");
	}

	@Override
	public int insertGoods(GoodsDTO g_dto) throws Exception  {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne(namespace + ".goodsMaxNum");
		
		g_dto.setG_NUM(maxNum + 1);
		
		sessionTemplate.insert(namespace + ".insertGoods", g_dto);
		
		return g_dto.getG_NUM();
		
	}
	
	@Override
	public void insertGoodsDetail(GoodsDetailDTO gd_dto, int g_num) throws Exception {
		
		//상품 번호 세팅
		gd_dto.setGD_NUM(g_num);
		String gCode;
		
		//상품 코드 세팅
		gCode = gd_dto.getGD_NUM() + "-" + gd_dto.getGD_KIND_NUM() + "-" + gd_dto.getGD_DEVICE() + "-" + gd_dto.getGD_COLOR();		
		gd_dto.setGD_CODE(gCode);
		
		sessionTemplate.insert(namespace + ".insertGoodsDetail", gd_dto);
		
	}
	
	@Override
	public void updateGoodsCount(GoodsDTO g_dto) throws Exception {
		
		sessionTemplate.update(namespace + ".updateGoodsCount", g_dto);
		
	}

	@Override
	public void updateGoods(GoodsDTO g_dto) throws Exception  {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteGoods(String g_code) throws Exception  {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberDTO> memberList() throws Exception  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void authority(String m_id) throws Exception  {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<OrdersDTO> ordersList() throws Exception  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsDTO> goodsList(int start, int end, String searchKey, String searchValue) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		return sessionTemplate.selectList(namespace + ".getGoodsLists", params);
		
	}

	@Override
	public int getGoodsCount(String searchKey, String searchValue) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne(namespace + ".getGoodsCount", params);
		
		return result;
		
	}

}
