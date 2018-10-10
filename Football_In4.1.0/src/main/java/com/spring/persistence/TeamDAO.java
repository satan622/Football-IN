package com.spring.persistence;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;

public interface TeamDAO {
	void create(TeamVO vo) throws Exception;
	TeamVO read(Integer tno) throws Exception;
	void update(TeamVO vo) throws Exception;
	void delete(Integer tno) throws Exception;
	List<TeamVO> listAll() throws Exception;
	
	//페이징
	List<TeamVO> listPage(int page) throws Exception;
	List<TeamVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
		
	//검색
	List<TeamVO> listSearch(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
	
}
