package com.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.MatchVO;
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
	
	@RequestMapping(value="registFutsal", method=RequestMethod.POST)
	public String registFutsal(MatchVO match, Model model) throws Exception{
		logger.info("registMatch post...!!");
		logger.info(match.toString());
		
		service.registMatch(match);
		
		model.addAttribute("match", match);
		return "/matches/registResult";
	}
}
