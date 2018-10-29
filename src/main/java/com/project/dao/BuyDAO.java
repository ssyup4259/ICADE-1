package com.project.dao;

import com.project.dto.GoodsDetailDTO;

public interface BuyDAO {
	
	public GoodsDetailDTO getReadGoodsDetail(String gd_code) throws Exception;

}
