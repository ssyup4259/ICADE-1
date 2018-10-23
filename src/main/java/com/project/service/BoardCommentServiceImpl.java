package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.BoardCommentDTO;

public class BoardCommentServiceImpl implements BoardCommentService {

	@Override
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req) throws Exception {

		int bc_num;
		String saveFileName;
		
		
	}

	@Override
	public List<BoardCommentDTO> replyList(HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteData(int BC_NUM, String path) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
