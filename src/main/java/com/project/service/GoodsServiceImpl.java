package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.GoodsDAO;
import com.project.util.MyUtil;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	GoodsDAO g_dao;
	
	@Autowired
	MyUtil myUtil;
	
	

}
