package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.MatchVO;
import com.spring.domain.TeamVO;

public interface MatchService {
	void registMatch(MatchVO match) throws Exception;
	MatchVO detail(Integer mno) throws Exception;
	void updateAway(Integer mno, String away) throws Exception;
	void updateScore(MatchVO match) throws Exception;
	List<MatchVO> listAll() throws Exception;
	
	//페이징
	List<MatchVO> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
	
	TeamVO getTeam(String teamname) throws Exception;
	
	void win(String teamname) throws Exception;
	void draw(String teamname) throws Exception;
	void lose(String teamname) throws Exception;
	void goals(int totalgoals, int goalconceded, String teamname) throws Exception;
}
