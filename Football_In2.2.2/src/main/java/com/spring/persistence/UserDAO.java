package com.spring.persistence;

import java.util.List;

import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;

public interface UserDAO {
	UserVO login(LoginDTO dto) throws Exception;
	void create(UserVO vo)throws Exception;
	UserVO read(String uid) throws Exception;
	void update(UserVO vo) throws Exception; //미구현
	void delete(String uid) throws Exception; //미구현
	List<UserVO> listAll() throws Exception;
	
}
