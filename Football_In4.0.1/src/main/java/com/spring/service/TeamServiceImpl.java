package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.TeamVO;
import com.spring.persistence.TeamDAO;

@Service
public class TeamServiceImpl implements TeamService {
	@Inject
	private TeamDAO dao;

	@Override
	public void regist(TeamVO team) throws Exception {
		dao.create(team);
	}

	@Override
	public TeamVO read(Integer tno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(TeamVO team) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Integer tno) throws Exception {
		// TODO Auto-generated method stub

	}

}
