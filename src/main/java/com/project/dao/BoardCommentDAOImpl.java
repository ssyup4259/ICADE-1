package com.project.dao;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.BoardCommentDTO;
import com.project.dto.GoodsDTO;

@Repository
public class BoardCommentDAOImpl implements BoardCommentDAO {

	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws SQLException {
		this.sessionTemplate = sessionTemplate;
	}
	
	public static String replyMapper = "com.project.mybatis.replyMapper";
	
	@Override
	public int insertData(BoardCommentDTO bc_dto) throws Exception {
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne(replyMapper + ".replyMaxNum");
		
		bc_dto.setBC_NUM(maxNum + 1);
		
		sessionTemplate.insert(replyMapper + ".insertData", bc_dto);
		
		return bc_dto.getBC_NUM();
		
	}

	@Override
	public List<BoardCommentDTO> getReadData(String BC_ID) throws Exception {
		
		return sessionTemplate.selectList(replyMapper + ".listData");
	}

	@Override
	public void updateData(BoardCommentDTO bc_dto) throws Exception {
		
		sessionTemplate.update(replyMapper + ".updateData", bc_dto);
	}

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
