package com.spring.persistence;

import com.spring.domain.TeamVO;

public interface TeamDAO {
	void create(TeamVO vo) throws Exception;
	TeamVO read(Integer tno) throws Exception;
	void update(TeamVO vo) throws Exception;
	void delete(Integer tno) throws Exception;
	
}
