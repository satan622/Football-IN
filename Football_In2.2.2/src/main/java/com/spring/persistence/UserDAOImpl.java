package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.spring.persistence.UserDAO";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace + ".join", vo);
	}
	@Override
	public UserVO read(String uid) throws Exception {
		return session.selectOne(namespace + ".read", uid);
	}
	
	//회원정보 변경, 팀 탈퇴 등 사용
	@Override
	public void update(UserVO vo) throws Exception {
		
	}
	
	//회원 탈퇴에 사용
	@Override
	public void delete(String uid) throws Exception {
		
	}
	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	

	
}