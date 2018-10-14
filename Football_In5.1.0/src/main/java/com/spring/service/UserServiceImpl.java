package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;
import com.spring.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void join(UserVO vo) throws Exception {
		dao.create(vo);
	}
	
	@Override
	public UserVO read(String uid) throws Exception {
		return dao.read(uid);
	}
	
	//회원정보 변경, 팀 탈퇴 등 사용
	@Override
	public void modify(UserVO user) throws Exception {
		
	}

	//회원 탈퇴에 사용
	@Override
	public void remove(String uid) throws Exception {
		
	}

	@Override
	public List<UserVO> listAll() throws Exception {
		return dao.listAll();
	}
	
	//페이징------------------------------------------------
	@Override
	public List<UserVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	//검색------------------------------------------------
	@Override
	public List<UserVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	
}
 