package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;
import com.spring.persistence.TeamDAO;
import com.spring.persistence.UserDAO;

@Service
public class TeamServiceImpl implements TeamService {
	@Inject
	private TeamDAO dao;
	@Inject
	private UserDAO userDao;
	
	@Override
	public void create(TeamVO team) throws Exception {
		dao.create(team);
		userDao.manager(team.getMid());
	}

	@Override
	public TeamVO read(String tname) throws Exception {
		return dao.read(tname);
	}

	@Override
	public void modify(TeamVO team) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(String tname) throws Exception {
		// TODO Auto-generated method stub

	}
	
	@Override
	public List<TeamVO> listAll() throws Exception {
		return dao.listAll();
	}
	
	//페이징-----------------------------------------------------
	@Override
	public List<TeamVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
		
	//검색----------------------------------------------------------
	@Override
	public List<TeamVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
