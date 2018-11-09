package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.SupportCenterDTO;
@Repository
public class SupportDAOImpl implements SupportDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	public static String replyMapper = "com.project.mybatis.supportCenterMapper";
	
	//글 작성
	@Override
	public int insertData(SupportCenterDTO SC_DTO, int SC_NUM) throws Exception {
		
		int maxNum = 0;

		maxNum = sessionTemplate.selectOne(replyMapper + ".replyMaxNum");

		SC_DTO.setSC_NUM(maxNum + 1);

		sessionTemplate.insert(replyMapper + ".insertData", SC_DTO);

		return SC_DTO.getSC_NUM();

	}

	@Override
	public List<SupportCenterDTO> nonMemberCommentList() throws Exception {
		return null;
	}

	@Override
	public List<SupportCenterDTO> memberCommentList() throws Exception {
		return null;
	}

	@Override
	public List<SupportCenterDTO> nonCommentList() throws Exception {
		return null;
	}

	@Override
	public List<SupportCenterDTO> completeCommentList() throws Exception {
		return null;
	}

	@Override
	public void memberUpdateContent(SupportCenterDTO SC_DTO) throws Exception {
		
	}

	@Override
	public void adminUpdateContent(SupportCenterDTO SC_DTO) throws Exception {
	}

	@Override
	public void deleteData(int SC_NUM) throws Exception {
		
	}

	@Override
	public SupportCenterDTO getReadData(int SC_NUM) throws Exception {
		return null;
	}

	@Override
	public SupportCenterDTO readSubject(int SC_NUM) throws Exception {
		return null;
	}

}
