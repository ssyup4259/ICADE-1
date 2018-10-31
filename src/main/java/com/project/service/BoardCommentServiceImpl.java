package com.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
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
import com.project.util.MyUtil;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentDAO bc_dao;

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
		String save1 = null;
		String save2 = null;
		String save3 = null;

		MultipartFile file = req.getFile("bcFile");
		MultipartFile file1 = req.getFile("bcFile1");
		MultipartFile file2 = req.getFile("bcFile2");
		MultipartFile file3 = req.getFile("bcFile3");

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

		File f = new File(path);

		if (!f.exists()) {
			f.mkdirs();
		}

		String fileExt;
		String fileExt1;
		String fileExt2;
		String fileExt3;

		bc_dto.setBC_IMAGE(file.getOriginalFilename());
		fileExt = bc_dto.getBC_IMAGE().substring(bc_dto.getBC_IMAGE().lastIndexOf("."));
		System.out.println(fileExt);
		saveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFileName += System.nanoTime();
		saveFileName += fileExt;
		bc_dto.setBC_SAVEFILENAME(saveFileName);

		if (bc_dto.getBC_CONTENTFILE1() != null) {
			bc_dto.setBC_CONTENTFILE1(file1.getOriginalFilename());
			fileExt1 = bc_dto.getBC_CONTENTFILE1().substring(bc_dto.getBC_CONTENTFILE1().lastIndexOf("."));
			save1 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			save1 += System.nanoTime();
			save1 += fileExt1;
			bc_dto.setBC_SAVE1(save1);

		} else if (bc_dto.getBC_CONTENTFILE1() == null) {
			fileExt1 = null;
			save1 = null;
			bc_dto.setBC_SAVE1(save1);
		}

		if (bc_dto.getBC_CONTENTFILE2() != null) {
			fileExt2 = bc_dto.getBC_CONTENTFILE2().substring(bc_dto.getBC_CONTENTFILE2().lastIndexOf("."));
			save2 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			save2 += System.nanoTime();
			save2 += fileExt2;
			bc_dto.setBC_SAVE2(save2);
		} else if (bc_dto.getBC_CONTENTFILE2() == null) {
			save2 = null;
			bc_dto.setBC_SAVE1(save2);
		}

		if (bc_dto.getBC_CONTENTFILE3() != null) {
			fileExt3 = bc_dto.getBC_CONTENTFILE3().substring(bc_dto.getBC_CONTENTFILE3().lastIndexOf("."));
			save3 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
			save3 += System.nanoTime();
			save3 += fileExt3;
			bc_dto.setBC_SAVE3(save3);
		} else if (bc_dto.getBC_CONTENTFILE3() == null) {
			save3 = null;
			bc_dto.setBC_SAVE1(save3);
		}

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
		bc_num = bc_dao.insertData(bc_dto);
	}

	// 댓글 리스트
	@Override
	public HttpServletRequest replyList(HttpServletRequest req) throws Exception {

		String cp = req.getContextPath();

		int BC_BOARD = Integer.parseInt(req.getParameter("G_NUM"));
		String pageNum = req.getParameter("pageNum");
		String replyPageNum = req.getParameter("replyPageNum");
		int currentPage = 1;

		if (replyPageNum != null)
			currentPage = Integer.parseInt(replyPageNum);

		if (replyPageNum == null || replyPageNum.equals("")) {
			replyPageNum = "1";
		}

		// 전체데이터갯수
		int dataCount = bc_dao.countReply(BC_BOARD);

		// 전체페이지수
		int numPerPage = 3;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<BoardCommentDTO> bc_list = bc_dao.replyList(start, end, BC_BOARD);

		String param = "";
		param += "G_NUM=" + BC_BOARD;

		// 글보기 주소 정리
		String replyUrl = cp + "/goods/goodsArticle.action";

		if (!param.equals("")) {
			replyUrl = replyUrl + "?" + param;
		}

		String pageIndexList_r = myUtil.pageIndexList_r(currentPage, totalPage, replyUrl);

		req.setAttribute("pageIndexList", pageIndexList_r);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("bc_lists", bc_list);
		req.setAttribute("replyPageNum", replyPageNum);

		return req;

	}

	// 하나의 댓글 읽어오기
	@Override
	public BoardCommentDTO getReadReply(int bc_num) throws Exception {

		return bc_dao.getReadData(bc_num);
	}

	// 댓글 업데이트
	@Override
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req, HttpServletRequest request) throws Exception {

		int BC_NUM = Integer.parseInt(request.getParameter("BC_NUM"));
		bc_dto.setBC_NUM(BC_NUM);
		bc_dto.setBcfile(req.getFile("bcfile"));
		bc_dto.setBcfile1(req.getFile("bcfile1"));
		bc_dto.setBcfile2(req.getFile("bcfile2"));
		bc_dto.setBcfile3(req.getFile("bcfile3"));
		
		System.out.println(bc_dto.getBC_BOARD());
		System.out.println(bc_dto.getBC_CONTENT());
		System.out.println(bc_dto.getBC_ID());
		System.out.println(bc_dto.getBC_IMAGE());
		System.out.println(bc_dto.getBC_NUM());
		System.out.println(bc_dto.getBC_PARENT());
		System.out.println(bc_dto.getBcfile());
		System.out.println(bc_dto.getBcfile1());
		System.out.println(bc_dto.getBcfile2());
		System.out.println(bc_dto.getBcfile3());
		
		
		if (!bc_dto.getBcfile().isEmpty()) {

			bc_dto = bc_dao.getReadData(bc_dto.getBC_NUM());
			String saveFileName = bc_dto.getBC_SAVEFILENAME();
			String path = req.getSession().getServletContext().getRealPath("/resources/goods");

			File f = new File(path);

			if (f.exists()) {

				f.delete();

				MultipartFile file = req.getFile("bcFile");

				bc_dto.setBC_IMAGE(file.getOriginalFilename());

				String fileExt = bc_dto.getBC_IMAGE().substring(bc_dto.getBC_IMAGE().lastIndexOf("."));
				if (fileExt == null || fileExt.equals("")) {
					return;
				}

				String newSaveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName += System.nanoTime();
				newSaveFileName += fileExt;

				// 저장될 파일명 세팅

				bc_dto.setBC_SAVEFILENAME(newSaveFileName);

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
	} else if(bc_dto.getBcfile()==null){

		bc_dto = bc_dao.getReadData(bc_dto.getBC_NUM());

		bc_dto.setBC_IMAGE(bc_dto.getBC_IMAGE());
		bc_dto.setBC_SAVEFILENAME(bc_dto.getBC_SAVEFILENAME());
	}
		bc_dao.updateData(bc_dto);
	}
	@Override
	public void deleteData(int BC_NUM, String path) throws Exception {

		bc_dao.deleteData(BC_NUM, path);

	}

}
