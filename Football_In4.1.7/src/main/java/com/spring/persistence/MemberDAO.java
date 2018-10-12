package com.spring.persistence;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;

public interface MemberDAO {
	void joinTeam(MemberVO vo) throws Exception;
	List<MemberVO> list(String tname) throws Exception;
	
	//페이징
	List<MemberVO> listPage(String tname, Criteria cri) throws Exception;
	int count(String tname) throws Exception;
}
