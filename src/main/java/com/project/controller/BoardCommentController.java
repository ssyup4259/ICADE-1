package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
	
	// 상품페이지 내 포토후기 입력
	@RequestMapping(value="/replyinsert.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyinsertData(HttpServletRequest req)throws Exception{
		
		int G_NUM = Integer.parseInt(req.getParameter("G_NUM"));
		
		req.setAttribute("G_NUM", G_NUM);
		
	 	return "reply/photoCreate";
	}
	@RequestMapping(value="/replyinsert_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyInsert_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_BOARD = Integer.parseInt(request.getParameter("G_NUM"));
	 	bc_service.insertData(bc_dto, req, request);
	 	
	 	return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	//상품페이지 내 포토후기 리스트
	@RequestMapping("/replyList.action")
	public String listData(HttpServletRequest req)throws Exception{
		
		 bc_service.replyList(req);
		 
		 return "reply/photoList";
	}
	
	//상품페이지 내 포토후기 수정
	@RequestMapping(value="/replyUpdate.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyupdateData(HttpServletRequest req)throws Exception{
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		System.out.println(BC_NUM);
		BoardCommentDTO bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("bc_dto", bc_dto);
		
	 	return "reply/photoUpdate";
	}
	//상품페이지 내 포토후기 수정
	@RequestMapping("/replyUpdate_ok.action")
	public String replyUpdate_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_BOARD = Integer.parseInt(request.getParameter("BC_BOARD"));
		
		bc_service.updateData(bc_dto, req, request);
		
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	//상품페이지 내 포토후기 삭제
	@RequestMapping(value="/replyDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteData(HttpServletRequest req)throws Exception{
		
		int BC_BOARD = Integer.parseInt(req.getParameter("BC_BOARD"));
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/reply");
		
		bc_service.deleteData(BC_NUM, path);
		
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	
	//포토후기 전체 리스트
	@RequestMapping(value="/replyAllList.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String listAll(HttpServletRequest req)throws Exception{
		
		bc_service.replyAllList(req);
		
		 return "reply/photoAllList";
	}
	//포토후기 상세 페이지
	@RequestMapping(value="/replyArticle.action" ,method= {RequestMethod.GET,RequestMethod.POST})
	public String replyArticle(HttpServletRequest req)throws Exception{
		
		bc_service.replyArticle(req);
		
		return "reply/photoArticle";
	}
	//포토후기 상세 페이지 수정
	@RequestMapping(value="/articleUpdate.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String articleUpdate(HttpServletRequest req)throws Exception{
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		System.out.println(BC_NUM);
		BoardCommentDTO bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("bc_dto", bc_dto);
		
	 	return "reply/photoArticleUpdate";
	}
	//포토후기 상세 페이지 수정-1
	@RequestMapping("/articleUpdate_ok.action")
	public String articleUpdate_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_NUM = Integer.parseInt(request.getParameter("BC_NUM"));
		bc_service.updateData(bc_dto, req, request);
		
		return "redirect:/goods/replyArticle.action?BC_NUM="+BC_NUM;
	}
	//포토후기 삭제
	@RequestMapping(value="/articleDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String articleDelete(HttpServletRequest req)throws Exception{
		
		int replyPageNum = Integer.parseInt(req.getParameter("replyPageNum"));
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/reply");
		
		bc_service.deleteData(BC_NUM, path);
		
		return "redirect:/goods/replyAllList.action?replyPageNum="+replyPageNum;
	}
	
	
	//전체에서 대댓글 등록
	@RequestMapping(value="/commentInsert.action")
	@ResponseBody
	public void replyComment(BoardCommentDTO bc_dto, HttpServletRequest req)throws Exception{
		
		bc_service.replyComment(bc_dto, req);
		
		
	}
	//전체에서 대댓글 리스트
	@RequestMapping("/replyCommentList.action")
	public String replyCommentList(HttpServletRequest req)throws Exception{
		
		 bc_service.replyCommentList(req);
		 
		 return "reply/replyComment";
	}
	//상품 상세페이지에서 대댓글 상세보기
	@RequestMapping(value="/goodsReplyComment.action", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView goodsReplyComment(@RequestParam("BC_NUM")int BC_NUM ,BoardCommentDTO bc_dto,ModelAndView mav)throws Exception{
		
		bc_dto = bc_service.getReadReply(BC_NUM);
		
		System.out.println(bc_dto.getBC_ID());
		System.out.println(bc_dto.getBC_BOARD());
		
		
		mav.addObject("bc_dto",bc_dto);
		mav.setViewName("reply/goodsReplyModify");
		
		System.out.println("타냐");
		
		return mav;
	}
	//상품 상세페이지에서 대댓글 업데이트 
	@RequestMapping(value="/goodsReplyUpdate.action")
	@ResponseBody
	public void goodsReplyUpdate(BoardCommentDTO bc_dto, HttpServletRequest req,@RequestParam("BC_BOARD")int BC_BOARD)throws Exception{
		
		bc_service.updateReply(bc_dto, req);
	}
	//상품 상세 페이지에서 대댓글 삭제
	@RequestMapping(value="/goodsReplyDelete.action")
	@ResponseBody
	public void goodsReplyDelete(@RequestParam("BC_NUM")int BC_NUM,@RequestParam("BC_BOARD")int BC_BOARD)throws Exception{
		System.out.println(BC_NUM);
		System.out.println(BC_BOARD);
		bc_service.deleteReply(BC_NUM);
	}
	
	
	
	/*//포토후기 상세페이지에서 대댓글 업데이트
	@RequestMapping(value="/photoReplyComment.action")
	@ResponseBody
	public String photoReplyComment(BoardCommentDTO bc_dto, HttpServletRequest req)throws Exception{
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		System.out.println(BC_NUM);
		bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("bc_dto", bc_dto);
		return "reply/goodsReplyModify";
	}
	//수정확인
	@RequestMapping(value="/photoReplyComment_ok.action")
	@ResponseBody
	public String photoReplyComment_ok(BoardCommentDTO bc_dto, HttpServletRequest req)throws Exception{
		
		
	
		int BC_BOARD =Integer.parseInt(req.getParameter("BC_BOARD"));
		
		
		bc_service.updateReply(bc_dto, req);
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	*/
	//포토후기 상세페이지에서 대댓글 삭제
	@RequestMapping(value="/photoReplyDelete.action")
	@ResponseBody
	public void photoReplyDelete(BoardCommentDTO bc_dto, HttpServletRequest req)throws Exception{
		
		bc_service.replyComment(bc_dto, req);
	}
	
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
