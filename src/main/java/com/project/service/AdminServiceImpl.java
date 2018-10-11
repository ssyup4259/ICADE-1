package com.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.AdminDAO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO a_dao;
	
	@Transactional
	@Override
	public void insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int g_num;
		String saveFileName;
		
		String path = req.getSession().getServletContext().getRealPath("/WEB-INF/files");
		
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		MultipartFile file = req.getFile("gFile");
		
		g_dto.setG_PHOTO(file.getOriginalFilename());
		
		String fileExt = g_dto.getG_PHOTO().substring(g_dto.getG_PHOTO().lastIndexOf("."));
		if(fileExt == null || fileExt.equals(""))
			return;
		
		saveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFileName += System.nanoTime();
		
		saveFileName += fileExt;
		
		g_dto.setG_SAVEFILENAME(saveFileName);
		
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
				
			} catch (Exception e) { e.printStackTrace(); }
			
		}		
		
		g_num = a_dao.insertGoods(g_dto);
		
		
		a_dao.insertGoodsDetail(gd_dto, g_num);
		
		
	}
	
	@Override
	public void updateGoods(GoodsDTO g_dto) throws Exception  {
		
		a_dao.updateGoods(g_dto);
		
	}

	@Override
	public void deleteGoods(String g_code) throws Exception  {
		
		a_dao.deleteGoods(g_code);
		
	}

	@Override
	public List<MemberDTO> memberList() throws Exception  {
		
		return a_dao.memberList();
		
	}

	@Override
	public void authority(String m_id) throws Exception  {
		
		a_dao.authority(m_id);
		
	}

	@Override
	public List<OrdersDTO> ordersList() throws Exception  {

		return a_dao.ordersList();
		
	}
	@Override
	public List<GoodsDTO> goodsList() throws Exception {
		return a_dao.goodsList();
	}
	

}
