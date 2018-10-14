package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.MatchVO;
import com.spring.persistence.MatchDAO;

@Service
public class MatchServiceImpl implements MatchService{
	@Inject
	private MatchDAO dao;

	@Override
	public void registMatch(MatchVO match) throws Exception {
		dao.regist(match);
	}
	
	
}
