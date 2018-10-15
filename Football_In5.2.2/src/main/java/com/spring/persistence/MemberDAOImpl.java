package com.spring.persistence;

import java.util.List;

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
	
	@Override
	public List<MemberVO> list(String tname) throws Exception {
		return session.selectList(namespace + ".list", tname);
	}
	
	@Override
	public void exitTeam(String uid) throws Exception {
		session.delete(namespace + ".exitTeam", uid);
	}
	
	@Override
	public String getTname(String uid) throws Exception {
		return session.selectOne(namespace + ".getTname", uid);
	}
}
