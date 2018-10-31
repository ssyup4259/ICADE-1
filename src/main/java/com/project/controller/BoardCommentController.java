package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="/replyinsert.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyinsertData(HttpServletRequest req)throws Exception{
		
		int G_NUM = Integer.parseInt(req.getParameter("G_NUM"));
		
		req.setAttribute("G_NUM", G_NUM);
		
	 	return "goods/replyCreate";
	}
	@RequestMapping(value="/replyinsert_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyInsert_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_BOARD = Integer.parseInt(request.getParameter("G_NUM"));
	 	bc_service.insertData(bc_dto, req, request);
	 	
	 	return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	//댓글 리스트
	@RequestMapping("/replyList.action")
	public String listData(HttpServletRequest req)throws Exception{
		
		 bc_service.replyList(req);
		 
		 return "/goods/replyList";
	}
	
	//댓글 수정
	@RequestMapping(value="/replyUpdate.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyupdateData(HttpServletRequest req)throws Exception{
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		System.out.println(BC_NUM);
		BoardCommentDTO bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("bc_dto", bc_dto);
		
	 	return "goods/replyUpdate";
	}
	
	@RequestMapping("/replyUpdate_ok.action")
	public String replyUpdate_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_BOARD = Integer.parseInt(request.getParameter("BC_BOARD"));
		
		bc_service.updateData(bc_dto, req, request);
		
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	//댓글 삭제
	@RequestMapping(value="/replyDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteData(HttpServletRequest req)throws Exception{
		
		int BC_BOARD = Integer.parseInt(req.getParameter("BC_BOARD"));
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/reply");
		
		bc_service.deleteData(BC_NUM, path);
		
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	
	//댓글 전체 리스트
	@RequestMapping(value="/replyAllList.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String listAll(HttpServletRequest req)throws Exception{
		
		bc_service.replyAllList(req);
		
		 return "goods/replyAllList";
	}
	@RequestMapping(value="/replyArticle.action" ,method= {RequestMethod.GET,RequestMethod.POST})
	public String replyArticle(HttpServletRequest req)throws Exception{
		
		bc_service.replyArticle(req);
		
		return "goods/replyArticle";
	}
	@RequestMapping(value="/articleUpdate.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String articleUpdate(HttpServletRequest req)throws Exception{
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		System.out.println(BC_NUM);
		BoardCommentDTO bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("bc_dto", bc_dto);
		
	 	return "goods/articleUpdate";
	}
	
	@RequestMapping("/articleUpdate_ok.action")
	public String articleUpdate_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_NUM = Integer.parseInt(request.getParameter("BC_NUM"));
		bc_service.updateData(bc_dto, req, request);
		
		return "redirect:/goods/replyArticle.action?BC_NUM="+BC_NUM;
	}
	@RequestMapping(value="/articleDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String articleDelete(HttpServletRequest req)throws Exception{
		
		int replyPageNum = Integer.parseInt(req.getParameter("replyPageNum"));
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/reply");
		
		bc_service.deleteData(BC_NUM, path);
		
		return "redirect:/goods/replyAllList.action?replyPageNum="+replyPageNum;
	}
		
	@ModelAttribute
	HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
