package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;

public interface MemberService {
	void joinTeam (MemberVO member) throws Exception;
	List<MemberVO> listMembers(String tname) throws Exception;
	
	//페이징
	List<MemberVO> listMemberPage(String tname, Criteria cri) throws Exception;
	int count(String tname) throws Exception;
}
