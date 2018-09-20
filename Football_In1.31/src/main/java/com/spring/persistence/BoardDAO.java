package com.spring.persistence;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

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
}
