package com.spring.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.spring.persistence.MemberDAO";
	
	@Override
	public void joinTeam(MemberVO vo) throws Exception {
		session.insert(namespace + ".joinTeam", vo);
	}
}
