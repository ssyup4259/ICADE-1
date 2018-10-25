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
	public void insertData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req) throws Exception {

		int bc_num;
		String saveFileName;
		
		MultipartFile file = req.getFile("bcFile");
		String path =req.getSession().getServletContext().getRealPath("/resources/goods");
		
		System.out.println(file);
		System.out.println(bc_dto);
		
		File f  = new File(path);
		
		if (!f.exists()) {
			f.mkdirs();
		}
		
		bc_dto.setBC_IMAGE(file.getOriginalFilename());
		
		String fileExt = bc_dto.getBC_IMAGE().substring(bc_dto.getBC_IMAGE().lastIndexOf("."));
		
		saveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFileName += System.nanoTime();
		saveFileName += fileExt;
		bc_dto.setBC_SAVEFILENAME(saveFileName);
		
		if (file.getSize() >0 || file != null) {
			
			try {
				
				FileOutputStream fos = new FileOutputStream(path +"/" + saveFileName);
				InputStream is = file.getInputStream();
				
				byte[] buffer = new byte[512];
				
				while (true) {
					
					int data = is.read(buffer, 0, buffer.length);
					
					if (data == -1) {
						break;
					}
					fos.write(buffer,0,data);
				}
				
				is.close();
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		System.out.println(saveFileName);
		bc_num = bc_dao.insertData(bc_dto);
	}
	//댓글 리스트
	@Override
	public HttpServletRequest replyList(HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		
		int BC_BOARD = Integer.parseInt(req.getParameter("G_NUM"));
		System.out.println(BC_BOARD);
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		if(pageNum == null)
			pageNum ="1";
		
			
		//전체데이터갯수
		int dataCount = bc_dao.countReply(BC_BOARD);
		
		//전체페이지수
		int numPerPage = 7;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<BoardCommentDTO>bc_list = bc_dao.replyList(start, end ,BC_BOARD);
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, pageNum);
		
		req.setAttribute("pageIndexList", pageIndexList);
		req.setAttribute("bc_lists", bc_list);
		
		return req;
	}
	//하나의 댓글 읽어오기
	@Override
	public BoardCommentDTO getReadReply(int bc_num) throws Exception {

		return bc_dao.getReadData(bc_num);
	}
	
	//댓글 업데이트
	@Override
	public void updateData(BoardCommentDTO bc_dto, MultipartHttpServletRequest req) throws Exception {
		
		if (!bc_dto.getBcFile().isEmpty()) {
			
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
				newSaveFileName +=fileExt;
				
				//저장될 파일명 세팅
				
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
						
					} catch (Exception e) { e.printStackTrace(); }
					
				}
				
			}
			
			
		}else {
			
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
