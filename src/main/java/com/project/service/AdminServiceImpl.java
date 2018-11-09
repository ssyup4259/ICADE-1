package com.project.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.project.controller.AdminController;
import com.project.dao.AdminDAO;
import com.project.dto.DeviceKindDTO;
import com.project.dto.GoodsColorDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.GoodsDetailDTO;
import com.project.dto.GoodsKindDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrdersDTO;
import com.project.dto.PaymentsDTO;
import com.project.util.MyUtil;
import com.project.util.RestAPI;

@Service
public class AdminServiceImpl implements AdminService {
	
	Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminDAO a_dao;
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	RestAPI api;
	
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
		String saveContentFileName;
		
		String path = req.getSession().getServletContext().getRealPath("/resources/goodsImage");
		String content_path = req.getSession().getServletContext().getRealPath("/resources/goodsContentImage");
		
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		File f2 = new File(content_path);
		if (!f2.exists()) {
			f2.mkdirs();
		}
		
		MultipartFile file = req.getFile("gFile");
		MultipartFile file2 = req.getFile("gFile2");
		
		g_dto.setG_PHOTO(file.getOriginalFilename());
		g_dto.setG_CONTENT_ORIGINAL_FILE(file2.getOriginalFilename());
		
		String fileExt = g_dto.getG_PHOTO().substring(g_dto.getG_PHOTO().lastIndexOf("."));
		String contentFileExt = "";
		
		if (g_dto.getG_CONTENT_ORIGINAL_FILE().lastIndexOf(".") == -1) {
			
		} else {
			contentFileExt = g_dto.getG_CONTENT_ORIGINAL_FILE().substring(g_dto.getG_CONTENT_ORIGINAL_FILE().lastIndexOf("."));
		}
		
		if(fileExt == null || fileExt.equals(""))
			return;
		
		
		saveFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveFileName += System.nanoTime();
		
		saveContentFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
		saveContentFileName += System.nanoTime();
		
		saveFileName += fileExt;
		saveContentFileName += contentFileExt;
		
		g_dto.setG_SAVEFILENAME(saveFileName);
		g_dto.setG_CONTENT_SAVE_FILE(saveContentFileName);
		
		if(contentFileExt == null || contentFileExt.equals("")) {
			g_dto.setG_CONTENT_SAVE_FILE("");
		}
		
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
		
		if (file2.getSize() > 0 || file2 != null) {
			
			if (g_dto.getG_CONTENT_SAVE_FILE() == null || g_dto.getG_CONTENT_SAVE_FILE().equals("")) {
				
			} else {
				
				try {
					
					FileOutputStream fos = new FileOutputStream(content_path + "/" + saveContentFileName);
					
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
					
				} catch (Exception e) { e.printStackTrace(); }
				
			}
			
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
	
	//상품 리스트 (완료)
	@Override
	public HttpServletRequest goodsList(HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if (searchKey == null || searchKey.equals("")) {
			
			searchKey = "G_NAME";
			searchValue = "";
			
		} else {
			
			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		String gdKindNum = req.getParameter("GD_KIND_NUM");
		
		if (gdKindNum == null || gdKindNum.equals("")) {
			gdKindNum = "";
		}
		
		//전체데이터갯수
		int dataCount = a_dao.getGoodsCount(searchKey, searchValue, gdKindNum);
		
		//전체페이지수
		int numPerPage = 5;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<GoodsDTO> g_lists = a_dao.goodsList(start, end, gdKindNum, searchKey, searchValue);
		
		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "GD_KIND_NUM=" + gdKindNum;
			param = "&searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		} else {
			param = "GD_KIND_NUM=" + gdKindNum;
		}
		
		String listUrl = cp + "/admin/goodsList.action";
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
		
		//상품 설명 사진
		//파일이 NULL이 아닐 경우 == 사진을 변경하는 경우
		if (!g_dto.getgFile2().isEmpty()) {
			
			//기존의 사진 파일 삭제 후 변경된 사진 추가
			
			String path = req.getSession().getServletContext().getRealPath("/resources/goodsContentImage");
			String saveFileName = a_dao.getReadGoods(g_dto.getG_NUM()).getG_CONTENT_SAVE_FILE();
			
			String filePath = path + File.separator + saveFileName;
			
			File f = new File(filePath);
			
			if (f.exists()) {
				
				f.delete(); //기존의 사진파일 삭제
				
				//수정된 사진 파일 물리적으로 추가
				MultipartFile file = req.getFile("gFile2");
				
				//원본파일명 세팅
				g_dto.setG_CONTENT_ORIGINAL_FILE(file.getOriginalFilename());
				
				String fileExt = "";
				
				if (g_dto.getG_CONTENT_ORIGINAL_FILE().lastIndexOf(".") == -1) {
					
				} else {
					fileExt = g_dto.getG_CONTENT_ORIGINAL_FILE().substring(g_dto.getG_CONTENT_ORIGINAL_FILE().lastIndexOf("."));
				}
				
				String newSaveFileName2 = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newSaveFileName2 += System.nanoTime();
				
				newSaveFileName2 += fileExt;
				
				if(fileExt == null || fileExt.equals("")) {
					newSaveFileName2 = "";
				}
				
				//저장될 파일명 세팅
				g_dto.setG_CONTENT_SAVE_FILE(newSaveFileName2);
				
				if (file.getSize() > 0 || file != null) {
					
					try {
						
						FileOutputStream fos = new FileOutputStream(path + "/" + newSaveFileName2);
						
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
			
			if (dto.getG_CONTENT_ORIGINAL_FILE() == null || dto.getG_CONTENT_ORIGINAL_FILE().equals("")) {
				
				g_dto.setG_CONTENT_ORIGINAL_FILE("");
				g_dto.setG_CONTENT_SAVE_FILE("");
				
			} else {
				
				g_dto.setG_CONTENT_ORIGINAL_FILE(dto.getG_CONTENT_ORIGINAL_FILE());
				g_dto.setG_CONTENT_SAVE_FILE(dto.getG_CONTENT_SAVE_FILE());
				
			}
			
		}
		
		a_dao.updateGoods(g_dto);
		
	}

	//상품 삭제 (완료)
	@Override
	public void deleteGoods(int g_num, String path, String cPath) throws Exception  {
		a_dao.deleteGoods(g_num, path, cPath);
	}

	//상세 상품의 정보 (완료)
	@Override
	public List<GoodsDetailDTO> getReadGoodsDetail(int g_num) throws Exception {
		return a_dao.getReadGoodsDetail(g_num);
	}
	
	//재고 수정 (완료)
	@Override
	public void updateGoodsDetailCount(HttpServletRequest req) throws Exception {
		
		//배열 형태로 코드와 수량을 받음
		String[] gd_code = req.getParameterValues("GD_CODE");
		String[] gd_count = req.getParameterValues("GD_COUNT");
		
		//코드,수량 형태로 Map에 넣음
		HashMap<String, String> hMap = new HashMap<String, String>();
		
		for (int i = 0; i < gd_count.length; i++) {
			
			hMap.put("gd_code", gd_code[i]);
			hMap.put("gd_count", gd_count[i]);
			
			a_dao.updateGoodsDetailCount(hMap);
			
		}
		
	}
	
	//회원 리스트
	@Override
	public HttpServletRequest memberList(HttpServletRequest req) throws Exception  {
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String m_rank = req.getParameter("M_RANK");
		
		if (m_rank == null || m_rank.equals("")) {
			m_rank = "";
		}
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if (searchKey == null) {
			
			searchKey = "M_ID";
			searchValue = "";
			
		} else {
			
			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = a_dao.getMemberCount(m_rank, searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		List<MemberDTO> m_lists = a_dao.memberList(start, end, m_rank, searchKey, searchValue);
		
		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "m_rank=" + m_rank;
			param = "&searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/memberList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("m_lists", m_lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("M_RANK", m_rank);
		req.setAttribute("searchKey", searchKey);
		req.setAttribute("searchValue", searchValue);
		
		return req;
		
	}

	//회원에게 권한 부여
	@Override
	public void authorityChange(HttpServletRequest req) throws Exception  {
		
		String m_id = req.getParameter("m_id");
		String new_rank = req.getParameter("new_rank");
		
		a_dao.authorityChange(m_id, new_rank);
		
	}

	//회원 주문내역 조회
	@Override
	public HttpServletRequest payments(HttpServletRequest req) throws Exception  {
		
		List<PaymentsDTO> p_lists = new ArrayList<PaymentsDTO>();
		
		String imp_key = URLEncoder.encode("0721555779852842", "UTF-8");
		String imp_secret = URLEncoder.encode("qSKG3wd6friMZRuJNne1gGg0CQ2gFks6ddNhJ0nZsGMrxgalEpnU5DUIuXYairhwF4Np4boxRaYpr9K5", "UTF-8");
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", imp_key);
		json.addProperty("imp_secret", imp_secret);
		
		String token = api.getToken(json);
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String o_status = req.getParameter("o_status");
		
		if (o_status == null || o_status.equals("")) {
			o_status = "";
		}
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if (searchKey == null) {
			
			searchKey = "O_ID";
			searchValue = "";
			
		} else {
			
			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = a_dao.getOrdersCount(o_status, searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("o_status", o_status);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("start", start);
		map.put("end", end);
		
		List<String> imp_uid = a_dao.imp_uidList(map);
		
		//페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "o_status=" + o_status;
			param = "&searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/admin/payments.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		Iterator<String> it = imp_uid.iterator();
		
		while (it.hasNext()) {
			
			String impUid = it.next();
			
			log.info(impUid);
			
			PaymentsDTO p_dto = api.getInfo(token, impUid);
			
			if (p_dto.getStatus().equals("ready")) {
				p_dto.setStatus("미결제");				
			} else if (p_dto.getStatus().equals("paid")) {
				p_dto.setStatus("결제완료");				
			} else if (p_dto.getStatus().equals("cancelled")) {
				p_dto.setStatus("결제취소");				
			} else if (p_dto.getStatus().equals("failed")) {
				p_dto.setStatus("결제실패");				
			}
			
			if (p_dto.getPay_method().equals("samsung")) {
				p_dto.setPay_method("삼성페이");				
			} else if (p_dto.getPay_method().equals("card")) {
				p_dto.setPay_method("신용카드");				
			} else if (p_dto.getPay_method().equals("trans")) {
				p_dto.setPay_method("계좌이체");				
			} else if (p_dto.getPay_method().equals("vbank")) {
				p_dto.setPay_method("가상계좌");				
			}
			
			//유닉스타임 형식 날짜를 DateTime으로 변환
			String source = p_dto.getPaid_at();
			long t = Long.parseLong(source + "000"); 
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.KOREA);
			p_dto.setPaid_at(simpleDate.format(t));
			
			if (p_dto.getCancelled_at() != "0" && !p_dto.getCancelled_at().equals("0")) {
				
				source = p_dto.getCancelled_at();
				t = Long.parseLong(source + "000"); 
				simpleDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.KOREA);
				p_dto.setCancelled_at(simpleDate.format(t));
				
			}
						
			p_lists.add(p_dto);
			
		}
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("p_lists", p_lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("o_status", o_status);

		return req;
		
	}

}
