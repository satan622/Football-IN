package com.spring.service;

import java.util.List;

import com.spring.domain.MemberVO;

public interface MemberService {
	void joinTeam(MemberVO member) throws Exception;
	void exitTeam(String uid) throws Exception;
	List<MemberVO> listMembers(String tname) throws Exception;
	
}
