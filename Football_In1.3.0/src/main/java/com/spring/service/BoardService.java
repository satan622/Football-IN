package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {
	void regist(BoardVO board) throws Exception;
	BoardVO read(Integer bno) throws Exception;
	void modify(BoardVO board) throws Exception;
	void remove(Integer bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
	//페이징
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
}
