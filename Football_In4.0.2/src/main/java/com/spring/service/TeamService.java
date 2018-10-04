package com.spring.service;

import com.spring.domain.TeamVO;

public interface TeamService {
	void regist(TeamVO team) throws Exception;
	TeamVO read(Integer tno) throws Exception;
	void modify(TeamVO team) throws Exception;
	void remove(Integer tno) throws Exception;
}
