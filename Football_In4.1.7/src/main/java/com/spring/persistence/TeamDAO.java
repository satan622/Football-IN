package com.spring.persistence;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;

public interface TeamDAO {
	void create(TeamVO vo) throws Exception;
	TeamVO read(String tname) throws Exception;
	void update(TeamVO vo) throws Exception;
	void delete(String tname) throws Exception;
	List<TeamVO> listAll() throws Exception;
	
	//페이징
	List<TeamVO> listPage(int page) throws Exception;
	List<TeamVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
		
	//검색
	List<TeamVO> listSearch(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
	
	//인원 수 증감
	void updatePeople(String teamname, int amount) throws Exception;
}
