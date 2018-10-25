package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.service.BoardCommentService;

@Controller
public class BoardCommentController {
	
	
	@Autowired
	BoardCommentService bc_service;
	
	

}
