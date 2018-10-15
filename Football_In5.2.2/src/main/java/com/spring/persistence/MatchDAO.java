package com.spring.persistence;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MatchVO;
import com.spring.domain.TeamVO;

public interface MatchDAO {
	void regist(MatchVO vo) throws Exception;
	MatchVO detail(Integer mno) throws Exception;
	void updateAway(Integer mno, String away) throws Exception;
	void updateScore(MatchVO vo) throws Exception;
	List<MatchVO> listAll() throws Exception;
	
	
	//페이징
	List<MatchVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
	
	TeamVO getTeam(String teamname) throws Exception;
}
