package com.spring.service;

import java.util.List;

import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;

public interface UserService {
	UserVO login(LoginDTO dto) throws Exception;
	void join(UserVO vo) throws Exception;
	UserVO read(String uid) throws Exception;
	void modify(UserVO user) throws Exception; //미구현
	void remove(String uid) throws Exception; //미구현
	List<UserVO> listAll() throws Exception;
}
