package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;

public interface BoardService {
	void regist(BoardVO board) throws Exception;
	BoardVO read(Integer bno) throws Exception;
	void modify(BoardVO board) throws Exception;
	void remove(Integer bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
	//페이징
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	int listCountCriteria(Criteria cri) throws Exception;
	
	//검색
	List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
}
