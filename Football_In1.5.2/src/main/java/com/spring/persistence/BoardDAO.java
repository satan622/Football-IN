package com.spring.persistence;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;

public interface BoardDAO {
	void create(BoardVO vo) throws Exception;
	BoardVO read(Integer bno) throws Exception;
	void update(BoardVO vo) throws Exception;
	void delete(Integer bno) throws Exception;
	List<BoardVO> listAll() throws Exception;
	
	//페이징
	List<BoardVO> listPage(int page) throws Exception;
	List<BoardVO> listCriteria(Criteria cri) throws Exception;
	int countPaging(Criteria cri) throws Exception;
	
	//검색
	List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	int listSearchCount(SearchCriteria cri) throws Exception;
}
