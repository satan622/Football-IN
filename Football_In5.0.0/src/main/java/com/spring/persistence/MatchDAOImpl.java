package com.spring.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.MatchVO;

@Repository
public class MatchDAOImpl implements MatchDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.spring.persistence.MatchDAO";
	
	@Override
	public void regist(MatchVO vo) throws Exception {
		session.insert(namespace + ".regist", vo);
	}
}
