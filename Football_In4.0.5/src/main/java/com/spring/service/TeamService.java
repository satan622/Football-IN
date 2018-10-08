package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;

public interface TeamService {
	void create(TeamVO team) throws Exception;
	TeamVO read(Integer tno) throws Exception;
	void modify(TeamVO team) throws Exception;
	void remove(Integer tno) throws Exception;
	List<TeamVO> listAll() throws Exception;
	
	//페이징
	List<TeamVO> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
		
	//검색
	List<TeamVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
	
}
