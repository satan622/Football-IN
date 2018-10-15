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

import com.spring.domain.Criteria;
import com.spring.domain.MatchVO;
import com.spring.domain.PageMaker;
import com.spring.domain.TeamVO;
import com.spring.service.MatchService;

@Controller
@RequestMapping("/matches/*")
public class MatchController {
	@Inject
	private MatchService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MatchController.class);
	
	@RequestMapping(value="/registFootball", method=RequestMethod.GET)
	public void registFootball(Model model) throws Exception{
		logger.info("registMatch get...!!");
	}
	
	@RequestMapping(value="registFootball", method=RequestMethod.POST)
	public String registFootball(MatchVO match, Model model) throws Exception{
		logger.info("registMatch post...!!");
		logger.info(match.toString());
		
		service.registMatch(match);
		
		model.addAttribute("match", match);
		return "/matches/registResult";
	}
	@RequestMapping(value="/registFutsal", method=RequestMethod.GET)
	public void registFutsal(Model model) throws Exception{
		logger.info("registMatch get...!!");
	}
	
	@RequestMapping(value="/registFutsal", method=RequestMethod.POST)
	public String registFutsal(MatchVO match, Model model) throws Exception{
		logger.info("registMatch post...!!");
		logger.info(match.toString());
		
		service.registMatch(match);
		
		model.addAttribute("match", match);
		return "/matches/registResult";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void showDetail(@RequestParam("mno") int mno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("mno: " + mno);
		MatchVO matchVO = service.detail(mno);
		model.addAttribute(matchVO);
		
		TeamVO home = service.getTeam(matchVO.getHome());
		TeamVO away = service.getTeam(matchVO.getAway());
		model.addAttribute("home", home);
		model.addAttribute("away", away);
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public String registAway(@RequestParam("teamname") String teamname, @RequestParam("mno") int mno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		service.updateAway(mno, teamname);
		return "/matches/list";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void liatAll(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		model.addAttribute("list", service.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
}
