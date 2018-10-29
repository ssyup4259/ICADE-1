package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}

	public static String noticeMapper = "com.project.mybatis.NoticeMapper";

	//공지 개수 구하기 (완료)
	@Override
	public int getNoticeCount(String searchKey, String searchValue) throws Exception {
			
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne(noticeMapper + ".getNoticeCount", params);
		
		return result;
		
	}
	
	//공지 리스트 (완료)
		@Override
		public List<NoticeDTO> noticeList(int start, int end, String searchKey, String searchValue) throws Exception {
				
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("start", start);
			params.put("end", end);
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			
			return sessionTemplate.selectList(noticeMapper + ".getNoticeLists", params);
				
		}

}
