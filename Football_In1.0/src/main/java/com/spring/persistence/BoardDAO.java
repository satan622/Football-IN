package com.spring.persistence;

import java.util.List;

import com.spring.domain.BoardVO;

public interface BoardDAO {
	void create(BoardVO vo) throws Exception;
	BoardVO read(Integer bno) throws Exception;
	void update(BoardVO vo) throws Exception;
	void delete(Integer bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
}
