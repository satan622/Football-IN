package com.spring.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.PageMaker;
import com.spring.domain.SearchCriteria;
import com.spring.domain.TeamVO;
import com.spring.service.TeamService;

@Controller
@RequestMapping("/team/*")
public class TeamController {
	@Inject
	private TeamService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	//목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void create(Model model) throws Exception {
		logger.info("create get...!!");
	}
	
	//팀 생성
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(TeamVO team, RedirectAttributes rttr) throws Exception {
		logger.info("create post...!!");
		logger.info(team.toString());

		service.create(team);
		
		return "redirect:/team/list";
	}
	
	//팀 조회
	@RequestMapping(value = "/readTeam", method = RequestMethod.GET)
	public void read(@RequestParam("teamname") String teamname, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(teamname));
	}
	
}
