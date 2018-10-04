package com.spring.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.TeamVO;

@Repository
public class TeamDAOImpl implements TeamDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.spring.persistence.TeamDAO";
	
	@Override
	public void create(TeamVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public TeamVO read(Integer tno) throws Exception {
		return null;
	}

	@Override
	public void update(TeamVO vo) throws Exception {

	}

	@Override
	public void delete(Integer tno) throws Exception {

	}

}
