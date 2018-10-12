package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PageMaker;
import com.spring.domain.ReplyVO;
import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;
import com.spring.service.MemberService;

@RestController
@RequestMapping("/members/*")
public class MemberController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ResponseEntity<String> join(HttpServletRequest request, @RequestBody MemberVO vo, LoginDTO dto)
			throws Exception {
		ResponseEntity<String> entity = null;

		try {
			service.joinTeam(vo);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		// 팀 가입시 로그인 세션에는 팀 값이 들어가지 않아 직접 넣었음
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		user.setTeam(vo.getTname());
		session.setAttribute("login", user);

		return entity;
	}

	// 특정 팀의 모든 멤버 조회
	@RequestMapping(value = "/{tname}", method = RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> list(@PathVariable("tname") String tname) {
		ResponseEntity<List<MemberVO>> entity = null;

		try {
			entity = new ResponseEntity<>(service.listMembers(tname), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//페이징
	@RequestMapping(value = "/{tname}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("tname") String tname,
			@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<>();
			List<MemberVO> list = service.listMemberPage(tname, cri);

			map.put("list", list);

			int memberCount = service.count(tname);
			pageMaker.setTotalCount(memberCount);

			entity = new ResponseEntity<>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
