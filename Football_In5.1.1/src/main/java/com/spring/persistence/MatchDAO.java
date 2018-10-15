package com.spring.persistence;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MatchVO;

public interface MatchDAO {
	void regist(MatchVO vo) throws Exception;
	
	List<MatchVO> listAll() throws Exception;
	
	//페이징
	List<MatchVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
	
}
