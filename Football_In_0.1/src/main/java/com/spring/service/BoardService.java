package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;

public interface BoardService {
	void regist(BoardVO board) throws Exception;
	BoardVO read(Integer bno) throws Exception;
	void modify(BoardVO board) throws Exception;
	void remove(Integer bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
}
