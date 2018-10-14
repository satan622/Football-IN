package com.spring.persistence;

import com.spring.domain.MatchVO;

public interface MatchDAO {
	void regist(MatchVO vo) throws Exception;
}
