package com.spring.persistence;

import com.spring.domain.MemberVO;

public interface MemberDAO {
	void joinTeam(MemberVO vo) throws Exception;
	
}
