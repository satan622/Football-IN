package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO dao;  
	
	@Override
	public void joinTeam(MemberVO member) throws Exception {
		dao.joinTeam(member);
	}
	
}
