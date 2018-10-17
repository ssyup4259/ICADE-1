package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CartDAO;
import com.project.util.MyUtil;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO c_dao;
	
	@Autowired
	MyUtil myUtil;
	
	

}
