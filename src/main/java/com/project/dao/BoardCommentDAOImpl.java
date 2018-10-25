package com.project.dao;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.BoardCommentDTO;

@Repository
public class BoardCommentDAOImpl implements BoardCommentDAO {

	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String replyMapper = "com.project.mybatis.replyMapper";
	
	
	//댓글입력
	@Override
	public int insertData(BoardCommentDTO bc_dto) throws Exception {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne(replyMapper + ".replyMaxNum");
		
		bc_dto.setBC_NUM(maxNum + 1);
		
		sessionTemplate.insert(replyMapper + ".insertData", bc_dto);
		
		return bc_dto.getBC_NUM();
		
	}
	
	//댓글리스트
	@Override
	public List<BoardCommentDTO> replyList(String BC_ID) throws Exception {
		
		return sessionTemplate.selectList(replyMapper + ".listData");
	}
	
	//하나의 댓글 읽어오기
	@Override
	public BoardCommentDTO getReadData(int bc_num) throws Exception {
		return sessionTemplate.selectOne(replyMapper +".readData");
	}

	
	//댓글 수정
	@Override
	public void updateData(BoardCommentDTO bc_dto) throws Exception {
		
		sessionTemplate.update(replyMapper + ".updateData", bc_dto);
	}
	//댓글 삭제
	@Override
	public void deleteData(int BC_NUM,String path) throws Exception {
		
		BoardCommentDTO bc_dto = sessionTemplate.selectOne(replyMapper + ".readData", BC_NUM);
		
		String filePath = path + File.separator+bc_dto.getBC_IMAGE();
		
		//물리적 파일 삭제
		File f = new File(filePath);
	
		if (f.exists()) {
			f.delete(); //물리적 파일 삭제
		}
		sessionTemplate.delete(replyMapper + ".deleteGoods", BC_NUM);
	}




}
