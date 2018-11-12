package com.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.NoticeDAO;
import com.project.dto.GoodsDTO;
import com.project.dto.NoticeDTO;
import com.project.util.MyUtil;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO n_dao;

	@Autowired
	MyUtil myUtil;

	// 공지 리스트 (완료)
	@Override
	public HttpServletRequest noticeList(HttpServletRequest req) throws Exception {

		String cp = req.getContextPath();

		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");

		if (searchKey == null) {

			searchKey = "BN_SUBJECT";
			searchValue = "";

		} else {

			if (req.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		// 전체데이터갯수
		int dataCount = n_dao.getNoticeCount(searchKey, searchValue);

		// 전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<NoticeDTO> n_lists = n_dao.noticeList(start, end, searchKey, searchValue);

		Iterator<NoticeDTO> it = n_lists.iterator();

		while (it.hasNext()) {

			NoticeDTO n_dto = it.next();

			// 줄바꿈 작업
			n_dto.setBN_CONTENT(n_dto.getBN_CONTENT().replace("\r\n", "<br/>"));

		}

		// 페이징 처리
		String param = "";
		if (!searchValue.equals("")) {
			param = "searchKey=" + searchKey;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/noticeList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		// 글보기 주소 정리
		String articleUrl = cp + "/listDetail.action?pageNum=" + currentPage;

		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;

		// 포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("n_lists", n_lists);
		req.setAttribute("pageIndexList", pageIndexList);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("articleUrl", articleUrl);

		return req;
	}
	
	//공지 1개 
	@Override
	public NoticeDTO getNoticeDetail(int BN_NUM) throws Exception{
		return n_dao.getReadNoticeDetail(BN_NUM);
	}
	
	@Override
	public void noticeRegister(NoticeDTO n_dto) throws Exception{
		n_dao.noticeRegister(n_dto);
	}

	//업데이트
	@Override
	public void updateNotice(HttpServletRequest req) throws Exception {
		
		String BN_NUM = req.getParameter("BN_NUM");
		String BN_SUBJECT = req.getParameter("BN_SUBJECT");
		String BN_CONTENT = req.getParameter("BN_CONTENT");
		
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("BN_SUBJECT", BN_SUBJECT);
		hMap.put("BN_CONTENT", BN_CONTENT);
		hMap.put("BN_NUM", BN_NUM);
		
		n_dao.updateNotice(hMap);
	}

	//삭제
	@Override
	public void deleteNotice(int BN_NUM) throws Exception {
		n_dao.deleteNotice(BN_NUM);
	}
}
