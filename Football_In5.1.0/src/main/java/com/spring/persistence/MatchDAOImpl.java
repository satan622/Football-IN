package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.Criteria;
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

	@Override
	public List<MatchVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<MatchVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
}
