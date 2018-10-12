package com.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.Criteria;
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
	
	// 페이징---------------------------------------------------------------------
	@Override
	public List<MemberVO> listPage(String tname, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("uid", tname);
		paramMap.put("cri", cri);

		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(String tname) throws Exception {
		return session.selectOne(namespace + ".count", tname);
	}
}
