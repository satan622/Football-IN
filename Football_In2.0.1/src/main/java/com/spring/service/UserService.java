package com.spring.service;

import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;

public interface UserService {
	UserVO login(LoginDTO dto) throws Exception;
}
