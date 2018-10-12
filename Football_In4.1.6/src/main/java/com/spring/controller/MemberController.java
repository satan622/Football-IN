package com.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.MemberVO;
import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;
import com.spring.service.MemberService;
import com.spring.service.UserService;

@RestController
@RequestMapping("/members/*")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ResponseEntity<String> join(HttpServletRequest request, @RequestBody MemberVO vo, LoginDTO dto) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			service.joinTeam(vo);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		user.setTeam(vo.getTname());
		session.setAttribute("login", user);
		
		return entity;
	}
	

	// 특정 게시물의 모든 댓글 조회
//	@RequestMapping(value = "all/{bno}", method = RequestMethod.GET)
//	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {
//		ResponseEntity<List<ReplyVO>> entity = null;
//
//		try {
//			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}

}
