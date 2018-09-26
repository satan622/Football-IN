package com.spring.persistence;

import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;

public interface UserDAO {
	UserVO login(LoginDTO dto) throws Exception;
}
