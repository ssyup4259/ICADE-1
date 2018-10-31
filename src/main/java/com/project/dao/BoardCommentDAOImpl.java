package com.project.dao;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
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
	//댓글 개수 구하기
	@Override
	public int countReply(int BC_BOARD) throws Exception {
		return sessionTemplate.selectOne(replyMapper+".countReply",BC_BOARD); 
	}
	
	
	
	//댓글리스트
	@Override
	public List<BoardCommentDTO> replyList(int start,int end, int BC_BOARD) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("BC_BOARD" ,BC_BOARD);
		params.put("start", start);
		params.put("end", end);
		
		return sessionTemplate.selectList(replyMapper + ".listData", params);
	}
	
	//하나의 댓글 읽어오기
	@Override
	public BoardCommentDTO getReadData(int BC_NUM) throws Exception {
		return sessionTemplate.selectOne(replyMapper +".readData",BC_NUM);
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
		
		System.out.println(BC_NUM +"adsasdasfafasdasdsd");
		
		String filePath = path + File.separator+bc_dto.getBC_SAVEFILENAME();
		String filePath1 = path + File.separator+bc_dto.getBC_SAVE1();
		String filePath2 = path + File.separator+bc_dto.getBC_SAVE2();
		String filePath3 = path + File.separator+bc_dto.getBC_SAVE3();
		
		//물리적 파일 삭제
		File f = new File(filePath);
	
		if (f.exists()) {
			f.delete(); //물리적 파일 삭제
		}
		//물리적 파일 삭제
		File f1 = new File(filePath1);
	
		if (f1.exists()) {
			f1.delete(); //물리적 파일 삭제
		}
		//물리적 파일 삭제
		File f2 = new File(filePath2);
	
		if (f2.exists()) {
			f2.delete(); //물리적 파일 삭제
		}
		//물리적 파일 삭제
		File f3 = new File(filePath3);
	
		if (f3.exists()) {
			f3.delete(); //물리적 파일 삭제
		}
		
		sessionTemplate.delete(replyMapper + ".deleteData", BC_NUM);
	}
	//댓글 전체 리스트
	@Override
	public List<BoardCommentDTO> replyAllList(int start, int end) throws Exception {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
				
		params.put("start", start);
		params.put("end", end);
		
		return sessionTemplate.selectList(replyMapper + ".replyAllList", params);
	}
	@Override
	public int countAllReply() throws Exception {
		
	return sessionTemplate.selectOne(replyMapper+".countAllReply");
		
	}
	@Override
	public BoardCommentDTO getReadOne(int bc_num) throws Exception {
		return sessionTemplate.selectOne(replyMapper+".readOne",bc_num );
	}
	
	@Override
	public BoardCommentDTO readSubject(int bc_num) throws Exception {
		return sessionTemplate.selectOne(replyMapper+".readSubject", bc_num);
	}
}
