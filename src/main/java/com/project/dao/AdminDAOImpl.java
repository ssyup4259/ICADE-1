package com.project.dao;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public static String adminMapper = "com.project.mybatis.adminMapper";
	
	//상품 종류 목록 (완료)
	@Override
	public List<GoodsKindDTO> getGoodsKindList() throws Exception {
		return sessionTemplate.selectList(adminMapper + ".getGoodsKind");
	}
	
	//상품 기종 목록 (완료)
	@Override
	public List<DeviceKindDTO> getDeviceList() throws Exception {
		return sessionTemplate.selectList(adminMapper + ".getDevice");
	}
	
	//색상 목록 (완료)
	@Override
	public List<GoodsColorDTO> getColorList() throws Exception {
		return sessionTemplate.selectList(adminMapper + ".getColor");
	}

	//상품 등록 (완료)
	@Override
	public int insertGoods(GoodsDTO g_dto) throws Exception  {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne(adminMapper + ".goodsMaxNum");
		
		g_dto.setG_NUM(maxNum + 1);
		
		sessionTemplate.insert(adminMapper + ".insertGoods", g_dto);
		
		return g_dto.getG_NUM();
		
	}
	
	//상세 상품 등록 (완료)
	@Override
	public void insertGoodsDetail(GoodsDetailDTO gd_dto, int g_num) throws Exception {
		
		//상품 번호 세팅
		gd_dto.setGD_NUM(g_num);
		String gCode;
		
		//상품 코드 세팅
		gCode = gd_dto.getGD_NUM() + "-" + gd_dto.getGD_KIND_NUM() + "-" + gd_dto.getGD_DEVICE() + "-" + gd_dto.getGD_COLOR();		
		gd_dto.setGD_CODE(gCode);
		
		sessionTemplate.insert(adminMapper + ".insertGoodsDetail", gd_dto);
		
	}
	
	//상품 1개의 정보 (완료)
	@Override
	public GoodsDTO getReadGoods(int g_num) throws Exception {
		return sessionTemplate.selectOne(adminMapper + ".getReadGoods", g_num);
	}

	//상품 수정 (완료)
	@Override
	public void updateGoods(GoodsDTO g_dto) throws Exception  {
		sessionTemplate.update(adminMapper + ".updateGoods", g_dto);
	}

	//상품 삭제 (완료)
	@Override
	public void deleteGoods(int g_num, String path, String cPath) throws Exception  {
		
		GoodsDTO g_dto = sessionTemplate.selectOne(adminMapper + ".getReadGoods", g_num);
		
		String filePath = path + File.separator + g_dto.getG_SAVEFILENAME();
		String cFilePath = cPath + File.separator + g_dto.getG_CONTENT_SAVE_FILE();
		
		File f = new File(filePath);
		
		if (f.exists()) {
			f.delete(); //물리적 파일 삭제
		}
		
		File f2 = new File(cFilePath);
		
		if (f2.exists()) {
			f2.delete(); //물리적 파일 삭제
		}
		
		sessionTemplate.delete(adminMapper + ".deleteGoods", g_num);
	}

	//상품 리스트 (완료)
	@Override
	public List<GoodsDTO> goodsList(int start, int end, String gdKindNum, String searchKey, String searchValue) throws Exception {
			
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("gdKindNum", gdKindNum);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		return sessionTemplate.selectList(adminMapper + ".getGoodsLists", params);
			
	}

	//상품 개수 구하기 (완료)
	@Override
	public int getGoodsCount(String searchKey, String searchValue) throws Exception {
			
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne(adminMapper + ".getGoodsCount", params);
		
		return result;
		
	}
	
	//상세 상품의 정보 (완료)
	@Override
	public List<GoodsDetailDTO> getReadGoodsDetail(int g_num) throws Exception {
		return sessionTemplate.selectList(adminMapper + ".getReadGoodsDetail", g_num);
	}
	
	//재고 수정 (완료)
	@Override
	public void updateGoodsDetailCount(HashMap<String, String> hMap) throws Exception {
		sessionTemplate.update(adminMapper + ".updateGoodsDetailCount", hMap);
	}
	
	//회원 리스트
	@Override
	public List<MemberDTO> memberList(int start, int end, String m_rank, String searchKey, String searchValue) throws Exception  {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("m_rank", m_rank);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		return sessionTemplate.selectList(adminMapper + ".getMemberLists", params);
	}
	
	//회원 수 구하기
	@Override
	public int getMemberCount(String m_rank, String searchKey, String searchValue) throws Exception {

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("m_rank", m_rank);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne(adminMapper + ".getMemberCount", params);
		
		return result;
		
	}

	//회원에게 권한 부여
	@Override
	public void authorityChange(String m_id, String new_rank) throws Exception  {
		
		Map<String, String> hMap = new HashMap<String, String>();
		
		hMap.put("m_id", m_id);
		hMap.put("new_rank", new_rank);
		
		sessionTemplate.update(adminMapper + ".authorityChange", hMap);
		
	}

	//회원 주문내역 조회
	@Override
	public List<OrdersDTO> ordersList() throws Exception  {
		// TODO Auto-generated method stub
		return null;
	}

	

}
