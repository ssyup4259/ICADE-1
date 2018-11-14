package com.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.BoardCommentDAO;
import com.project.dto.BoardCommentDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.util.MyUtil;
import com.project.util.ReplyPager;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	BoardCommentDAO bc_dao;

	@Autowired
	MyUtil myUtil;
	
	@Override
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)
			throws Exception {

		int BC_BOARD = Integer.parseInt(request.getParameter("G_NUM"));

		System.out.println(BC_BOARD);
		bc_dto.setBC_BOARD(BC_BOARD);
		int bc_num;
		String saveFileName;
		String save1;
		String save2;
		String save3;

		MultipartFile file = req.getFile("bcfile");
		MultipartFile file1 = req.getFile("bcfile1");
		MultipartFile file2 = req.getFile("bcfile2");
		MultipartFile file3 = req.getFile("bcfile3");

		String path = req.getSession().getServletContext().getRealPath("/resources/reply");

		System.out.println(file);
		System.out.println(file1);
		System.out.println(file2);
		System.out.println(file3);
		System.out.println(bc_dto.getBC_BOARD());
		System.out.println(bc_dto.getBC_CONTENT());
		System.out.println(bc_dto.getBC_ID());
		System.out.println(bc_dto.getBC_IMAGE());
		System.out.println(bc_dto.getBC_NUM());
		System.out.println(bc_dto.getBC_PARENT());
		
		
		System.out.println();
		System.out.println();
		System.out.println();
		bc_dto.setBC_CONTENT(bc_dto.getBC_CONTENT().replaceAll("\n", "<br/>"));
		System.out.println(bc_dto.getBC_CONTENT());	
		File f = new File(path);

		if (!f.exists()) {
			f.mkdirs();
		}

		String fileExt;
		String fileExt1;
		String fileExt2;
		String fileExt3;
		
		//파일 이름을 세팅함
		bc_dto.setBC_IMAGE(file.getOriginalFilename());
		bc_dto.setBC_CONTENTFILE1(file1.getOriginalFilename());
		bc_dto.setBC_CONTENTFILE2(file2.getOriginalFilename());
		bc_dto.setBC_CONTENTFILE3(file3.getOriginalFilename());
		
		System.out.println(bc_dto.getBC_IMAGE());
		System.out.println(bc_dto.getBC_CONTENTFILE1().length());
		System.out.println(bc_dto.getBC_CONTENTFILE2().length());
		System.out.println(bc_dto.getBC_CONTENTFILE3());
		
		//메인 사진은 무조건 등록해야함
		fileExt = bc_dto.getBC_IMAGE().substring(bc_dto.getBC_IMAGE().lastIndexOf("."));
		saveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFileName += System.nanoTime();
		saveFileName += fileExt;
		bc_dto.setBC_SAVEFILENAME(saveFileName);
		
		// 댓글 메인사진
		if (file.getSize() > 0 || file != null) {

			try {

				FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while (true) {

					int data = is.read(buffer, 0, buffer.length);

					if (data == -1) {
						break;
					}
					fos.write(buffer, 0, data);
				}

				is.close();
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		//파일 저장 이름 세팅
		if (bc_dto.getBC_CONTENTFILE1().length() !=0) {
			fileExt1 = bc_dto.getBC_CONTENTFILE1().substring(bc_dto.getBC_CONTENTFILE1().lastIndexOf("."));
			save1 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			save1 += System.nanoTime();
			save1 += fileExt1;
			bc_dto.setBC_SAVE1(save1);
			
			// 댓글 컨텐츠 사진
			if (file1.getSize() > 0 || file1 != null) {

				try {

					FileOutputStream fos = new FileOutputStream(path + "/" + save1);
					InputStream is = file1.getInputStream();

					byte[] buffer = new byte[512];

					while (true) {

						int data = is.read(buffer, 0, buffer.length);

						if (data == -1) {
							break;
						}
						fos.write(buffer, 0, data);
					}

					is.close();
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		} else if (bc_dto.getBC_CONTENTFILE1().length() == 0) {
			save1 = null;
			bc_dto.setBC_SAVE1(save1);
		}
		
		//파일 저장 이름 세팅.
		if (bc_dto.getBC_CONTENTFILE2().length() != 0) {
			fileExt2 = bc_dto.getBC_CONTENTFILE2().substring(bc_dto.getBC_CONTENTFILE2().lastIndexOf("."));
			save2 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			save2 += System.nanoTime();
			save2 += fileExt2;
			bc_dto.setBC_SAVE2(save2);
			
			// 댓글 컨텐츠 사진
			if (file2.getSize() > 0 || file2 != null) {

				try {

					FileOutputStream fos = new FileOutputStream(path + "/" + save2);
					InputStream is = file2.getInputStream();

					byte[] buffer = new byte[512];

					while (true) {

						int data = is.read(buffer, 0, buffer.length);

						if (data == -1) {
							break;
						}
						fos.write(buffer, 0, data);
					}

					is.close();
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			
			
			
		} else if (bc_dto.getBC_CONTENTFILE2().length() == 0) {
			save2 = null;
			bc_dto.setBC_SAVE2(save2);
		}

		
		//파일 저장 이름 세팅해주자.
		if (bc_dto.getBC_CONTENTFILE3().length() != 0) {
			fileExt3 = bc_dto.getBC_CONTENTFILE3().substring(bc_dto.getBC_CONTENTFILE3().lastIndexOf("."));
			save3 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			save3 += System.nanoTime();
			save3 += fileExt3;
			bc_dto.setBC_SAVE3(save3);
			
			// 댓글 컨텐츠 사진
			if (file3.getSize() > 0 || file3 != null) {

				try {

					FileOutputStream fos = new FileOutputStream(path + "/" + save3);
					InputStream is = file3.getInputStream();

					byte[] buffer = new byte[512];

					while (true) {

						int data = is.read(buffer, 0, buffer.length);

						if (data == -1) {
							break;
						}
						fos.write(buffer, 0, data);
					}

					is.close();
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			
			
		} else if (bc_dto.getBC_CONTENTFILE3().length() == 0) {
			save3 = null;
			bc_dto.setBC_SAVE3(save3);
		}

		
		
		bc_num = bc_dao.insertData(bc_dto);
	}

	// 포토리뷰 리스트
	@Override
	public HttpServletRequest replyList(HttpServletRequest req) throws Exception {


		int BC_BOARD = Integer.parseInt(req.getParameter("G_NUM"));
		String replyPageNum = req.getParameter("replyPageNum");
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		int count = bc_dao.countReply(BC_BOARD);
		
		
		ReplyPager replyPager = new ReplyPager(count, curPage);
		
		int start = replyPager.getPageBegin();
	    int end = replyPager.getPageEnd();

		List<BoardCommentDTO> bc_list = bc_dao.replyList(start, end, BC_BOARD);
		
		
		req.setAttribute("bc_lists", bc_list);
		req.setAttribute("replyPageNum", replyPageNum);
		req.setAttribute("replyPager", replyPager);
		return req;

	}

	// 하나의 댓글 읽어오기
	@Override
	public BoardCommentDTO getReadReply(int bc_num) throws Exception {

		return bc_dao.getReadData(bc_num);
	}

	// 댓글 업데이트
	@Override
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request)
			throws Exception {

		
		String saveFileName1 = null;
		String saveFileName2 = null;
		String saveFileName3 = null;
		String saveFileName4 = null;
		
		String newSaveFileName1 = null;
		String newSaveFileName2 = null;
		String newSaveFileName3 = null;
		String newSaveFileName4 = null;
		
		String save1 = null;
		String save2 = null;
		String save3 = null;
		String save4 = null;
		
		String image1 =null;
		String image2 =null;
		String image3 =null;
		String image4 =null;
		
		
		
		
		int BC_NUM = Integer.parseInt(request.getParameter("BC_NUM"));

		System.out.println(bc_dto.getBC_BOARD());
		System.out.println(bc_dto.getBC_CONTENT());
		System.out.println(bc_dto.getBC_ID());
		System.out.println(bc_dto.getBC_SAVEFILENAME());
		System.out.println(bc_dto.getBC_NUM());
		System.out.println(bc_dto.getBC_PARENT());
		System.out.println(bc_dto.getBcfile());
		System.out.println(bc_dto.getBcfile1());
		System.out.println(bc_dto.getBcfile2());
		System.out.println(bc_dto.getBcfile3());

		bc_dto.setBC_CONTENT(bc_dto.getBC_CONTENT().replaceAll("\n", "<br/>"));
		
		// 상품 메인사진
		if (!bc_dto.getBcfile().isEmpty()) {

			BoardCommentDTO bc_dto1 = new BoardCommentDTO();
			
			bc_dto1 = bc_dao.getReadData(bc_dto.getBC_NUM());
			String path = req.getSession().getServletContext().getRealPath("/resources/reply");

			File f = new File(path);

			if (f.exists()) {

				f.delete();

				MultipartFile file = req.getFile("bcfile");

				bc_dto1.setBC_IMAGE(file.getOriginalFilename());

				//저장되는 이미지 (화면xx)
				saveFileName1 = bc_dto1.getBC_IMAGE();
				
				String fileExt = bc_dto1.getBC_IMAGE().substring(bc_dto1.getBC_IMAGE().lastIndexOf("."));
				if (fileExt == null || fileExt.equals("")) {
					return;
				}

				String newSaveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName += System.nanoTime();
				newSaveFileName += fileExt;

				bc_dto1.setBC_SAVEFILENAME(newSaveFileName);
				
				// 저장될 파일명 세팅//보여지는 사진
				newSaveFileName1 =bc_dto1.getBC_SAVEFILENAME();

				if (file.getSize() > 0 || file != null) {

					try {

						FileOutputStream fos = new FileOutputStream(path + "/" + newSaveFileName);

						InputStream is = file.getInputStream();

						byte[] buffer = new byte[512];

						while (true) {

							int data = is.read(buffer, 0, buffer.length);

							if (data == -1) {
								break;
							}

							fos.write(buffer, 0, data);

						}

						is.close();
						fos.close();

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

			}
		} else if (bc_dto.getBcfile().isEmpty()) {

			BoardCommentDTO bc_dto2 = new BoardCommentDTO();
			
			bc_dto2 = bc_dao.getReadData(bc_dto.getBC_NUM());
			
			 image1 = bc_dto2.getBC_IMAGE();
			 save1 = bc_dto2.getBC_SAVEFILENAME();

			/*bc_dto.setBC_IMAGE(bc_dto.getBC_IMAGE());
			bc_dto.setBC_SAVEFILENAME(bc_dto.getBC_SAVEFILENAME());*/
		}

		
		
		if (!bc_dto.getBcfile1().isEmpty()) {


			BoardCommentDTO bc_dto3 = new BoardCommentDTO();
			
			bc_dto3 = bc_dao.getReadData(bc_dto.getBC_NUM());
			String path = req.getSession().getServletContext().getRealPath("/resources/reply");

			File f = new File(path);

			if (f.exists()) {

				f.delete();

				MultipartFile file1 = req.getFile("bcfile1");

				bc_dto3.setBC_CONTENTFILE1(file1.getOriginalFilename());
				saveFileName2 = bc_dto3.getBC_CONTENTFILE1();

				String fileExt = bc_dto3.getBC_CONTENTFILE1().substring(bc_dto3.getBC_CONTENTFILE1().lastIndexOf("."));
				if (fileExt == null || fileExt.equals("")) {
					return;
				}

				String newSaveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName += System.nanoTime();
				newSaveFileName += fileExt;

				// 저장될 파일명 세팅

				bc_dto3.setBC_SAVE1(newSaveFileName);
				newSaveFileName2 = bc_dto3.getBC_SAVE1();

				if (file1.getSize() > 0 || file1 != null) {

					try {

						FileOutputStream fos = new FileOutputStream(path + "/" + newSaveFileName);

						InputStream is = file1.getInputStream();

						byte[] buffer = new byte[512];

						while (true) {

							int data = is.read(buffer, 0, buffer.length);

							if (data == -1) {
								break;
							}

							fos.write(buffer, 0, data);

						}

						is.close();
						fos.close();

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

			}
		} else if (bc_dto.getBcfile1().isEmpty()) {

			BoardCommentDTO bc_dto4 = new BoardCommentDTO();

			bc_dto4 = bc_dao.getReadData(bc_dto.getBC_NUM());
			
			image2 = bc_dto4.getBC_CONTENTFILE1();
			 save2 = bc_dto4.getBC_SAVE1();
		}

		// 컨텐츠 사진
		if (!bc_dto.getBcfile2().isEmpty()) {

			BoardCommentDTO bc_dto5 = new BoardCommentDTO();
			
			bc_dto5 = bc_dao.getReadData(bc_dto.getBC_NUM());
			String path = req.getSession().getServletContext().getRealPath("/resources/reply");

			File f = new File(path);

			if (f.exists()) {

				f.delete();

				MultipartFile file = req.getFile("bcfile2");

				bc_dto5.setBC_CONTENTFILE2(file.getOriginalFilename());
				
				saveFileName3 = bc_dto5.getBC_CONTENTFILE2();

				String fileExt = bc_dto5.getBC_CONTENTFILE2().substring(bc_dto5.getBC_CONTENTFILE2().lastIndexOf("."));
				if (fileExt == null || fileExt.equals("")) {
					return;
				}

				String newSaveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName += System.nanoTime();
				newSaveFileName += fileExt;

				// 저장될 파일명 세팅

				bc_dto5.setBC_SAVE2(newSaveFileName);
				
				newSaveFileName3 = bc_dto5.getBC_SAVE2();

				if (file.getSize() > 0 || file != null) {

					try {

						FileOutputStream fos = new FileOutputStream(path + "/" + newSaveFileName);

						InputStream is = file.getInputStream();

						byte[] buffer = new byte[512];

						while (true) {

							int data = is.read(buffer, 0, buffer.length);

							if (data == -1) {
								break;
							}

							fos.write(buffer, 0, data);

						}

						is.close();
						fos.close();

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

			}
		} else if (bc_dto.getBcfile2().isEmpty()) {

			BoardCommentDTO bc_dto6 = new BoardCommentDTO();
			
			
			bc_dto6 = bc_dao.getReadData(bc_dto.getBC_NUM());

			image3 = bc_dto6.getBC_CONTENTFILE2();
			save3 = bc_dto6.getBC_SAVE2();
			
		}

		// 컨텐츠 사진
		if (!bc_dto.getBcfile3().isEmpty()) {

			BoardCommentDTO bc_dto7 = new BoardCommentDTO();
			
			bc_dto7 = bc_dao.getReadData(bc_dto.getBC_NUM());
			String saveFileName = bc_dto7.getBC_SAVE3();
			String path = req.getSession().getServletContext().getRealPath("/resources/reply");

			File f = new File(path);

			if (f.exists()) {

				f.delete();

				MultipartFile file = req.getFile("bcfile3");

				bc_dto7.setBC_CONTENTFILE3(file.getOriginalFilename());
				
				saveFileName4 = bc_dto7.getBC_CONTENTFILE3();

				String fileExt = bc_dto7.getBC_CONTENTFILE3().substring(bc_dto7.getBC_CONTENTFILE3().lastIndexOf("."));
				if (fileExt == null || fileExt.equals("")) {
					return;
				}

				String newSaveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName += System.nanoTime();
				newSaveFileName += fileExt;

				// 저장될 파일명 세팅

				bc_dto7.setBC_SAVE3(newSaveFileName);

				newSaveFileName4 = bc_dto7.getBC_SAVE3();
				
				if (file.getSize() > 0 || file != null) {

					try {

						FileOutputStream fos = new FileOutputStream(path + "/" + newSaveFileName);

						InputStream is = file.getInputStream();

						byte[] buffer = new byte[512];

						while (true) {

							int data = is.read(buffer, 0, buffer.length);

							if (data == -1) {
								break;
							}

							fos.write(buffer, 0, data);

						}

						is.close();
						fos.close();

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

			}
		} else if (bc_dto.getBcfile3().isEmpty()) {

			BoardCommentDTO bc_dto8 = new BoardCommentDTO();
			
			bc_dto8 = bc_dao.getReadData(bc_dto.getBC_NUM());

			image4 = bc_dto8.getBC_CONTENTFILE3();
			save4 = bc_dto8.getBC_SAVE3();
			
		}

		//컨텐츠 파일 이미지 저장(xx)
	/*	String saveFileName1 = null;
		String saveFileName2 = null;
		String saveFileName3 = null;
		String saveFileName4 = null;
		
		
		// 저장될 파일명 세팅
		String image1 =null;
		String image2 =null;
		String image3 =null;
		String image4 =null;
				
		
		// 저장될 파일명 세팅 -뿌려주는 
		String newSaveFileName1 = null;
		String newSaveFileName2 = null;
		String newSaveFileName3 = null;
		String newSaveFileName4 = null;
		
	
		//컨텐츠 파일 이미지 저장- 뿌려주는
		String save1 = null;
		String save2 = null;
		String save3 = null;
		String save4 = null;*/
		
		if (saveFileName1 == null) {
			bc_dto.setBC_IMAGE(image1);
		}else {
			bc_dto.setBC_IMAGE(saveFileName1);
		}
		if (saveFileName2 == null) {
			bc_dto.setBC_CONTENTFILE1(image2);
		}else {
			bc_dto.setBC_CONTENTFILE1(saveFileName2);
		}
		if (saveFileName3 == null) {
			bc_dto.setBC_CONTENTFILE2(image3);
		}else {
			bc_dto.setBC_CONTENTFILE2(saveFileName3);
		}
		if (saveFileName4 == null) {
			bc_dto.setBC_CONTENTFILE3(image4);
		}else {
			bc_dto.setBC_CONTENTFILE3(saveFileName4);
		}
		
		if(newSaveFileName1 == null) {
			bc_dto.setBC_SAVEFILENAME(save1);
		}else {
			bc_dto.setBC_SAVEFILENAME(newSaveFileName1);
		}
		if(newSaveFileName2 == null) {
			bc_dto.setBC_SAVE1(save2);
		}else {
			bc_dto.setBC_SAVE1(newSaveFileName2);
		}
		if(newSaveFileName3 == null) {
			bc_dto.setBC_SAVE2(save3);
		}else {
			bc_dto.setBC_SAVE2(newSaveFileName3);
		}
		if(newSaveFileName4 == null) {
			bc_dto.setBC_SAVE3(save4);
		}else {
			bc_dto.setBC_SAVE3(newSaveFileName4);
		}
		
		
		
		
		bc_dto.setBC_NUM(BC_NUM);
		bc_dto.setBC_CONTENT(bc_dto.getBC_CONTENT());
		bc_dto.setBC_ID(bc_dto.getBC_ID());
		bc_dto.setBC_BOARD(bc_dto.getBC_BOARD());
		bc_dto.setBC_PARENT(bc_dto.getBC_PARENT());
		
		
		bc_dao.updateData(bc_dto);
	}
	//댓글삭제
	@Override
	public void deleteData(int BC_NUM, String path) throws Exception {

		bc_dao.deleteData(BC_NUM, path);

	}
	//댓글 전체 리스트
	@Override
	public HttpServletRequest replyAllList(HttpServletRequest req) throws Exception {
		
		
		String cp = req.getContextPath();
		
		String replyPageNum = req.getParameter("replyPageNum");
		
		int currentPage = 1;

		if (replyPageNum != null)
			currentPage = Integer.parseInt(replyPageNum);

		if (replyPageNum == null || replyPageNum.equals("")) {
			replyPageNum = "1";
		}

		// 전체데이터갯수
		int dataCount = bc_dao.countAllReply();

		// 전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<BoardCommentDTO> bc_Alllist = bc_dao.replyAllList(start, end);

	/*	String param = "";
		param += "G_NUM=" + BC_BOARD;*/

		// 글보기 주소 정리
		String replyUrl = cp + "/goods/replyAllList.action";

		/*if (!param.equals("")) {
			replyUrl = replyUrl + "?" + param;
		}*/

		String pageIndexList_r = myUtil.pageIndexList_r(currentPage, totalPage, replyUrl);
		
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pageIndexList", pageIndexList_r);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("bc_Alllist", bc_Alllist);
		req.setAttribute("replyPageNum", replyPageNum);

		return req;
		
	}

	//하나의 댓글 상세페이지
	@Override
	public HttpServletRequest replyArticle(HttpServletRequest req) throws Exception {
		
				//갖고온 데이터 받기
				int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
				
				String replyPageNum = req.getParameter("replyPageNum");
				
				if (replyPageNum == null || replyPageNum.equals("")) {
					replyPageNum = "1";
				}
				
				BoardCommentDTO bc_dto =  bc_dao.getReadOne(BC_NUM);
				
				BoardCommentDTO sub_dto = bc_dao.readSubject(BC_NUM);
				
			
				req.setAttribute("replyPageNum", replyPageNum);
				req.setAttribute("bc_dto", bc_dto);
				req.setAttribute("sub_dto", sub_dto);
				
				return req;
	}
	//대댓글 등록
	@Override
	public HttpServletRequest replyComment(BoardCommentDTO bc_dto, HttpServletRequest req) throws Exception {
		
		int BC_NUM = Integer.parseInt(req.getParameter("BC_NUM"));
		int BC_BOARD = Integer.parseInt(req.getParameter("BC_BOARD"));
		String BC_ID =  req.getParameter("BC_ID");
		String BC_CONTENT =req.getParameter("BC_CONTENT");
		
		int BC_PARENT = BC_NUM;
		
		System.out.println(BC_BOARD);
		System.out.println(BC_ID);
		System.out.println(BC_CONTENT);
		System.out.println(BC_PARENT);
		
		bc_dto.setBC_BOARD(BC_BOARD);
		bc_dto.setBC_ID(BC_ID);
		bc_dto.setBC_CONTENT(BC_CONTENT);
		bc_dto.setBC_PARENT(BC_PARENT);
		
		
		bc_dao.insertData(bc_dto);
		
		return req;
	}
	//대댓글 리스트
	@Override
	public HttpServletRequest replyCommentList(HttpServletRequest req) throws Exception {
		
	
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		
		
		System.out.println(curPage);
		
		
		int BC_NUM =Integer.parseInt(req.getParameter("BC_NUM"));
		
		int count = bc_dao.countPrReply(BC_NUM);
		
		ReplyPager replyPager = new ReplyPager(count, curPage);
		
		int start = replyPager.getPageBegin();
	    int end = replyPager.getPageEnd();
	    
		System.out.println(start);
		System.out.println(end);
		System.out.println(count);
		System.out.println(curPage);
		
		List<BoardCommentDTO> rp_list = bc_dao.readReply(BC_NUM, start, end);
		
		req.setAttribute("rp_list", rp_list);
		req.setAttribute("replyPager", replyPager);
		return req;
	}

	//대댓글 수정
	@Override
	public void updateReply(BoardCommentDTO bc_dto, HttpServletRequest req) throws Exception {
		
		bc_dto.setBC_CONTENT(bc_dto.getBC_CONTENT());
		bc_dto.setBC_NUM(bc_dto.getBC_NUM());
		
		bc_dao.updateData(bc_dto);
		
	}

	@Override
	public void deleteReply(int BC_NUM) throws Exception {
		bc_dao.deleteReply(BC_NUM);
		
	}

	@Override
	public HttpServletRequest searchGoodsList(BoardCommentDTO bc_dto,HttpServletRequest req) throws Exception {
		
		String searchKey = req.getParameter("searchKey");
		String G_NAME = req.getParameter("G_NAME");
		String searchValue = req.getParameter("searchValue");
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		
		
		if (searchKey == null || searchKey.equals("")) {
			searchKey = "G_NAME";
		} else {
			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		System.out.println(searchKey);
		System.out.println(searchValue);
		
		int count =bc_dao.searchGoods(searchValue, G_NAME);
		
		ReplyPager replyPager = new ReplyPager(count, curPage);
		
		int start = replyPager.getPageBegin();
	    int end = replyPager.getPageEnd();
		
		
		List<BoardCommentDTO> g_list = bc_dao.searchGoodsList(searchKey, searchValue, start, end);
		
		
		req.setAttribute("g_list", g_list);
		req.setAttribute("replyPager", replyPager);
		
		return req;
	}
	
	

}
