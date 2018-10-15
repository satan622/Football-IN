package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MatchVO;

public interface MatchService {
	void registMatch(MatchVO match) throws Exception;
	
	List<MatchVO> listAll() throws Exception;
	
	//페이징
	List<MatchVO> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
	
}
