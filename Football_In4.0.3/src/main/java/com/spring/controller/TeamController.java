package com.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;
import com.spring.service.TeamService;

@Controller
@RequestMapping("/team")
public class TeamController {
	@Inject
	private TeamService service;

	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(Model model) throws Exception {
		logger.info("create get...!!");
	}
	
	//팀 생성
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(TeamVO team, Model model) throws Exception {
		logger.info("create post...!!");
		logger.info(team.toString());

		service.create(team);
		model.addAttribute("msg", "success");
		logger.info("create success");

		return "/home";
	}

	//팀 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("tno") int tno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.read(tno));
	}
}
