package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.AdminDAO;
import com.project.dto.BoardCommentDTO;
import com.project.dto.GoodsKindDTO;
import com.project.service.BoardCommentService;

@Controller
@RequestMapping("/goods/*")
public class BoardCommentController {
	
	
	@Autowired
	BoardCommentService bc_service;
	
	@Autowired
	AdminDAO a_dao;
	
	//댓글 입력
	@RequestMapping("replyInsert.action")
	@ResponseBody
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req)throws Exception{
		
		
	 	bc_service.insertData(bc_dto, req);
	 	
	 	
	}
	//댓글 리스트
	@RequestMapping("/replyList.action")
	public String listData(HttpServletRequest req)throws Exception{
		
		
		 bc_service.replyList(req);
		 
		 return "/goods/replyList";
	}
	
	//댓글 수정
	@RequestMapping("/replyUpdate.action")
	public String updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req)throws Exception{
		
		bc_service.updateData(bc_dto, req);
		return "/goods/goodsArticle";
	}
	
	
	

	//댓글 삭제
	@RequestMapping("/replyDelete.action")
	@ResponseBody
	public String deleteData(HttpServletRequest req)throws Exception{
		
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/goodsImage");
		
		bc_service.deleteData(BC_NUM, path);
		
		return "rediret:goods/goodsArticle.action";
	}
	
	
	@ModelAttribute
	HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
