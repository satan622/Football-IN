package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;

public interface UserService {
	UserVO login(LoginDTO dto) throws Exception;
	void join(UserVO vo) throws Exception;
	UserVO read(String uid) throws Exception;
	void modify(UserVO user) throws Exception; //미구현
	void remove(String uid) throws Exception; //미구현
	List<UserVO> listAll() throws Exception;
	
	//페이징
	List<UserVO> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
	
	//검색
	List<UserVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
}
