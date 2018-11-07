package com.project.dao;

import java.util.List;

import com.project.dto.BoardNoticeDTO;
import com.project.dto.GoodsDTO;
import com.project.dto.NoticeDTO;

public interface NoticeDAO {
	int getNoticeCount(String searchKey, String searchValue) throws Exception;

	List<NoticeDTO> noticeList(int start, int end, String searchKey, String searchValue) throws Exception;

	NoticeDTO getReadNoticeDetail(int BN_NUM) throws Exception;

}
