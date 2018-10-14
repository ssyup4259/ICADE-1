package com.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.AdminDAO;
import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;
import com.project.util.MyUtil;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO a_dao;
	
	@Autowired
	MyUtil myUtil;
	
	//상품 종류 목록 (완료)
	@Override
	public List<GoodsKindDTO> getGoodsKindList() throws Exception {
		return a_dao.getGoodsKindList();
	}
	
	//상품 종류 목록 (완료)
	@Override
	public List<DeviceKindDTO> getDeviceList() throws Exception {
		return a_dao.getDeviceList();
	}
	
	//색상 목록 (완료)
	@Override
	public List<GoodsColorDTO> getColorList() throws Exception {
		return a_dao.getColorList();
	}
	
	//상품 등록 (완료)
	@Transactional
	@Override
	public void insertGoods(GoodsDTO g_dto, GoodsDetailDTO gd_dto, MultipartHttpServletRequest req) throws Exception {
		
		int g_num;
		String saveFileName;
		
		String path = req.getSession().getServletContext().getRealPath("/resources/goodsImage");
		
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
		
		String[] deviceKind = req.getParameterValues("GD_DEVICE");
		
		int count = 0;
		
		for (int i = 0; i < deviceKind.length; i++) {
			
			gd_dto.setGD_DEVICE(Integer.parseInt(deviceKind[i]));
			
			String[] goodsColor = req.getParameterValues(gd_dto.getGD_DEVICE() + "_GD_COLOR");
			
			for (int j = 0; j < goodsColor.length; j++) {
				
				String[] goodsCount = req.getParameterValues(gd_dto.getGD_DEVICE() + "_GD_COUNT");
				
				gd_dto.setGD_COLOR(Integer.parseInt(goodsColor[j]));
				gd_dto.setGD_COUNT(Integer.parseInt(goodsCount[j]));
				a_dao.insertGoodsDetail(gd_dto, g_num);
				
				count += gd_dto.getGD_COUNT();
				
			}
			
		}
		
	}
	
	//상품 1개의 정보 (완료)
	@Override
	public GoodsDTO getReadGoods(int g_num) throws Exception {
		return a_dao.getReadGoods(g_num);
	}
	
	//상품 수정 (완료)
	@Override
	public void updateGoods(GoodsDTO g_dto, MultipartHttpServletRequest req) throws Exception  {
		
		//파일이 NULL이 아닐 경우 == 사진을 변경하는 경우
		if (!g_dto.getgFile().isEmpty()) {
			
			//기존의 사진 파일 삭제 후 변경된 사진 추가
			
			String path = req.getSession().getServletContext().getRealPath("/resources/goodsImage");
			String saveFileName = a_dao.getReadGoods(g_dto.getG_NUM()).getG_SAVEFILENAME();
			
			String filePath = path + File.separator + saveFileName;
			
			File f = new File(filePath);
			
			if (f.exists()) {
				
				f.delete(); //기존의 사진파일 삭제
				
				//수정된 사진 파일 물리적으로 추가
				MultipartFile file = req.getFile("gFile");
				
				//원본파일명 세팅
				g_dto.setG_PHOTO(file.getOriginalFilename());
				
				String fileExt = g_dto.getG_PHOTO().substring(g_dto.getG_PHOTO().lastIndexOf("."));
				if(fileExt == null || fileExt.equals(""))
					return;
				
				String newSaveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName += System.nanoTime();
				
				newSaveFileName += fileExt;
				
				//저장될 파일명 세팅
				g_dto.setG_SAVEFILENAME(newSaveFileName);
				
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
			
		} else { //파일이 NULL일 경우 = 사진을 변경하지 않을 경우
			
			//기존의 정보를 다시 세팅
			GoodsDTO dto = a_dao.getReadGoods(g_dto.getG_NUM());
			
			g_dto.setG_PHOTO(dto.getG_PHOTO());
			g_dto.setG_SAVEFILENAME(dto.getG_SAVEFILENAME());
			
		}
		
		a_dao.updateGoods(g_dto);
		
	}

	//상품 삭제 (완료)
	@Override
	public void deleteGoods(int g_num, String path) throws Exception  {
		a_dao.deleteGoods(g_num, path);
	}

	//상세 상품의 정보
	@Override
	public List<GoodsDetailDTO> getReadGoodsDetail(int g_num) throws Exception {
		return a_dao.getReadGoodsDetail(g_num);
	}
	
	//회원 리스트
	@Override
	public List<MemberDTO> memberList() throws Exception  {
		
		return a_dao.memberList();
		
	}

	//회원에게 권한 부여
	@Override
	public void authority(String m_id) throws Exception  {
		
		a_dao.authority(m_id);
		
	}

	//회원 주문내역 조회
	@Override
	public List<OrdersDTO> ordersList() throws Exception  {

		return a_dao.ordersList();
		
	}
	
	//상품 리스트
	@Override
	public HttpServletRequest goodsList(HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if (searchKey == null) {
			
			searchKey = "G_NAME";
			searchValue = "";
			
		} else {
			
			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = a_dao.getGoodsCount(searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		String gdKindNum = req.getParameter("GD_KIND_NUM");
		
		if (gdKindNum == null || gdKindNum.equals("")) {
			gdKindNum = "";
		}
		
		List<GoodsDTO> g_lists = a_dao.goodsList(start, end, gdKindNum, searchKey, searchValue);
		
		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "gdKindNum=" + gdKindNum;
			param = "&searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/goodsList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/goodsDetail.action?pageNum=" + currentPage;
			
		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("g_lists", g_lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("articleUrl",articleUrl);
		req.setAttribute("gdKindNum", gdKindNum);
		
		return req;
	}

	

	

}
