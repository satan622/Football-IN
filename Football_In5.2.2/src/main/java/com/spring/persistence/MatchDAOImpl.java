package com.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.Criteria;
import com.spring.domain.MatchVO;
import com.spring.domain.TeamVO;

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
	public MatchVO detail(Integer mno) throws Exception {
		return session.selectOne(namespace + ".detail", mno);
	}
	
	@Override
	public void updateAway(Integer mno, String away) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("mno", mno);
		paramMap.put("away", away);
		
		session.update(namespace + ".updateAway", paramMap);
	}
	

	@Override
	public void updateScore(MatchVO vo) throws Exception {
		session.update(namespace + ".updateScore", vo);
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
	
	@Override
	public TeamVO getTeam(String teamname) throws Exception {
		return session.selectOne(namespace + ".getTeam", teamname);
	}

}
