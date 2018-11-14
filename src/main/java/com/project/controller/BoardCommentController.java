package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.AdminDAO;
import com.project.dao.BoardCommentDAO;
import com.project.dto.BoardCommentDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.service.BoardCommentService;
import com.project.service.CookieService;
import com.project.service.WishService;

@Controller
@RequestMapping("/goods/*")
public class BoardCommentController {
	
	
	@Autowired
	BoardCommentService bc_service;
	
	@Autowired
	AdminDAO a_dao;
	@Autowired
	CookieService c_service;

	@Autowired
	WishService w_service;
	
	@Autowired
	BoardCommentDAO bc_dao;
	
	// 상품페이지 내 포토리뷰 입력
	@RequestMapping(value="/replyinsert.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyinsertData(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
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
	//상품페이지 내 포토리뷰 리스트
	@RequestMapping("/replyList.action")
	public String listData(HttpServletRequest req)throws Exception{
		 //쿠키
		 c_service.cookieList(req);
		 //포토리뷰리스트
		 bc_service.replyList(req);
		 
		 return "reply/photoList";
	}
	
	//상품페이지 내 포토리뷰 수정
	@RequestMapping(value="/replyUpdate.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String replyupdateData(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		System.out.println(BC_NUM);
		BoardCommentDTO bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("bc_dto", bc_dto);
		
	 	return "reply/photoUpdate";
	}
	//상품페이지 내 포토리뷰 수정
	@RequestMapping("/replyUpdate_ok.action")
	public String replyUpdate_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_BOARD = Integer.parseInt(request.getParameter("BC_BOARD"));
		
		bc_service.updateData(bc_dto, req, request);
		
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	//상품페이지 내 포토리뷰 삭제
	@RequestMapping(value="/replyDelete.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteData(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
		int BC_BOARD = Integer.parseInt(req.getParameter("BC_BOARD"));
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/reply");
		
		bc_service.deleteData(BC_NUM, path);
		
		return "redirect:/goods/goodsArticle.action?G_NUM="+BC_BOARD+"&#section3";
	}
	
	//포토리뷰 전체 리스트
	@RequestMapping(value="/replyAllList.action", method= {RequestMethod.GET,RequestMethod.POST})
	public String listAll(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
		bc_service.replyAllList(req);
		
		 return "reply/photoAllList";
	}
	//포토리뷰 상세 페이지
	@RequestMapping(value="/replyArticle.action" ,method= {RequestMethod.GET,RequestMethod.POST})
	public String replyArticle(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
		bc_service.replyArticle(req);
		
		return "reply/photoArticle";
	}
	//포토리뷰 상세 페이지 수정
	@RequestMapping(value="/articleUpdate.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String articleUpdate(HttpServletRequest req)throws Exception{
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		int replyPageNum = Integer.parseInt(req.getParameter("replyPageNum"));
		BoardCommentDTO bc_dto = bc_service.getReadReply(BC_NUM);
		
		req.setAttribute("replyPageNum", replyPageNum);
		req.setAttribute("bc_dto", bc_dto);
		
	 	return "reply/photoArticleUpdate";
	}
	//포토리뷰 상세 페이지 수정
	@RequestMapping("/articleUpdate_ok.action")
	public String articleUpdate_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
		int BC_NUM = Integer.parseInt(request.getParameter("BC_NUM"));
		int replyPageNum = Integer.parseInt(req.getParameter("replyPageNum"));
		bc_service.updateData(bc_dto, req, request);
		
		req.setAttribute("replyPageNum", replyPageNum);
		return "redirect:/goods/replyArticle.action?BC_NUM="+BC_NUM+"&replyPageNum="+replyPageNum;
	}
	//포토리뷰 삭제
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
		c_service.cookieList(req);
		bc_service.replyComment(bc_dto, req);
		
		
	}
	//전체에서 대댓글 리스트
	@RequestMapping("/replyCommentList.action")
	public String replyCommentList(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
		 bc_service.replyCommentList(req);
		 
		 return "reply/replyComment";
	}
	@RequestMapping("/photoReplyCommentList.action")
	public String photoReplyCommentList(HttpServletRequest req)throws Exception{
		c_service.cookieList(req);
		 bc_service.replyCommentList(req);
		 
		 return "reply/photoReplyComment";
	}
	//상품 상세페이지에서 대댓글 상세보기
	@RequestMapping(value="/goodsReplyComment.action", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView goodsReplyComment(@RequestParam("BC_NUM")int BC_NUM ,BoardCommentDTO bc_dto,ModelAndView mav)throws Exception{
		bc_dto = bc_service.getReadReply(BC_NUM);
		
		mav.addObject("bc_dto",bc_dto);
		mav.setViewName("reply/goodsReplyModify");
		
		return mav;
	}
	//포토후기에서 대댓글 상세보기
	@RequestMapping(value="/photoReplyComment.action", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView photoReplyComment(@RequestParam("BC_NUM")int BC_NUM ,BoardCommentDTO bc_dto,ModelAndView mav)throws Exception{
		bc_dto = bc_service.getReadReply(BC_NUM);
		
		mav.addObject("bc_dto",bc_dto);
		mav.setViewName("reply/photoReplyModifier");
		
		return mav;
	}
	//상품 상세페이지에서 대댓글 업데이트 
	@RequestMapping(value="/goodsReplyUpdate.action")
	@ResponseBody
	public void goodsReplyUpdate(BoardCommentDTO bc_dto, HttpServletRequest req,@RequestParam("BC_BOARD")int BC_BOARD)throws Exception{
		c_service.cookieList(req);
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
	
	
	
	
	//포토후기 상세페이지에서 대댓글 삭제
	@RequestMapping(value="/photoReplyDelete.action",method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void photoReplyDelete(BoardCommentDTO bc_dto, HttpServletRequest req)throws Exception{
		
		bc_service.replyComment(bc_dto, req);
	}
	//포토후기 게시판에서 포토후기 작성하기
	@RequestMapping(value="/photoInsertData.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String photoInsertData(HttpServletRequest req)throws Exception{
		
		int replyPageNum = Integer.parseInt(req.getParameter("replyPageNum"));
		c_service.cookieList(req);
		
		req.setAttribute("replyPageNum", replyPageNum);
	 	return "reply/photoArticleCreate";
	}
	@RequestMapping(value="/photoInsertData_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String photoInsertData_ok(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)throws Exception{
		
	 	bc_service.insertData(bc_dto, req, request);
	 
	 	System.out.println(bc_dto.getBC_NUM());
	 	int BC_NUM = bc_dto.getBC_NUM();
	 	int replyPageNum = Integer.parseInt(req.getParameter("replyPageNum"));
	 	
	 	return "redirect:/goods/replyArticle.action?BC_NUM="+BC_NUM+"&replyPageNum="+replyPageNum;
	}
	
	@RequestMapping(value="/searchGoodsList.action",method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView searchGoodsList(BoardCommentDTO bc_dto,HttpServletRequest req,ModelAndView mav) {
			try {
				bc_service.searchGoodsList(bc_dto, req);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.setViewName("reply/searchList");
		return mav;
	}
	
	
	
	
	@ModelAttribute
	public HttpServletRequest addAttributes(HttpServletRequest req) throws Exception {
		
		Cookie[] cookies = req.getCookies();
		
		List<String> c_lists = new ArrayList<String>();
		
		if(cookies != null){
	
			for(int i=0; i<cookies.length; i++){
				
				Cookie ck = cookies[i];
				
				if (ck.getName().equals("JSESSIONID") || ck.getName().equals("Cookie_userid")) {
					
				} else {
					
					String g_num = ck.getName();
					c_lists.add(g_num);
				}
			}
		}
		HttpSession session = req.getSession();
		MemberDTO vo = new MemberDTO();
		
		vo = (MemberDTO) session.getAttribute("userInfo");
		if(vo != null) {
			w_service.wishList(req);
			}
		req.setAttribute("c_lists", c_lists);
		List<GoodsKindDTO> gk_lists = a_dao.getGoodsKindList();
		req.setAttribute("gk_lists", gk_lists);
		
		return req;
        
    }

}
