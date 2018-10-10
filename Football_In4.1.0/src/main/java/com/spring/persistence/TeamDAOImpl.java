package com.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;

@Repository
public class TeamDAOImpl implements TeamDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.spring.persistence.TeamDAO";
	
	@Override
	public void create(TeamVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("team", vo.getTeamname());
		paramMap.put("uid", vo.getMid());
		session.update(namespace + ".manager", paramMap);
	}

	@Override
	public TeamVO read(Integer tno) throws Exception {
		return session.selectOne(namespace + ".read", tno);
	}

	@Override
	public void update(TeamVO vo) throws Exception {

	}

	@Override
	public void delete(Integer tno) throws Exception {

	}

	@Override
	public List<TeamVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	//페이징-----------------------------------------------------
	@Override
	public List<TeamVO> listPage(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;

		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<TeamVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
		
	//검색----------------------------------------------------------
	@Override
	public List<TeamVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	
}
