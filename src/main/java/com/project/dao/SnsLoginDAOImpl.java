package com.project.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;
import com.project.dto.SnsLoginDTO;

@Repository
public class SnsLoginDAOImpl implements SnsLoginDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplete;
	
	public void setSessionTemplete(SqlSessionTemplate sessionTemplete) throws SQLException{
		this.sessionTemplete = sessionTemplete;
	}
	
	public static String snsLoginMapper = "com.project.mybatis.snsLoginMapper";

	@Override
	public SnsLoginDTO selectNaverJoin(String sns_id) throws Exception {
		return sessionTemplete.selectOne(snsLoginMapper + ".selectNaverJoin",sns_id);
	}

	@Override
	public void joinNaverLogin(HashMap<String, Object> hMap) throws Exception {
		sessionTemplete.update(snsLoginMapper + ".joinNaverLogin",hMap);
	}

	@Override
	public List<String> randomIdCheck(String id) throws Exception {
		
		List<String> lists = sessionTemplete.selectList(snsLoginMapper + ".randomIdCheck",id);
		
		return lists;
	}

	@Override
	public MemberDTO snsJoinCheck(String sns_id) throws Exception {
		return sessionTemplete.selectOne(snsLoginMapper + ".snsJoinCheck",sns_id);
	}

	@Override
	public int countMember() throws Exception {
		return sessionTemplete.selectOne(snsLoginMapper + ".countMember");
	}

	@Override
	public void insertNaverMember(HashMap<String, Object> hMap) throws Exception {
		sessionTemplete.update(snsLoginMapper + ".insertNaverMember",hMap);
	}

}
