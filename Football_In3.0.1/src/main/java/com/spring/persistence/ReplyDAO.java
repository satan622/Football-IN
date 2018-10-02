package com.spring.persistence;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> list(Integer bno) throws Exception;
	void create(ReplyVO vo) throws Exception;
	void update(ReplyVO vo) throws Exception;
	void delete(Integer rno) throws Exception;
	
	//페이징
	List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
	int count(Integer bno) throws Exception;
	
	//댓글 수 증감을 위한 bno값 반환
	int getBno(Integer rno) throws Exception;
	
}
