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
	
	@RequestMapping(value="/registMatch", method=RequestMethod.GET)
	public void registMatch(Model model) throws Exception{
		logger.info("registMatch get...!!");
	}
	
	@RequestMapping(value="registMatch", method=RequestMethod.POST)
	public String registMatch(MatchVO match, Model model) throws Exception{
		logger.info("registMatch post...!!");
		logger.info(match.toString());
		
		service.registMatch(match);
		
		model.addAttribute("match", match);
		return "/matches/registResult";
	}
}
