package com.spring.persistence;

import java.util.List;

import com.spring.domain.MemberVO;

public interface MemberDAO {
	void joinTeam(MemberVO vo) throws Exception;
	void exitTeam(String uid) throws Exception;
	List<MemberVO> list(String tname) throws Exception;
	
	String getTname(String uid) throws Exception;
}
