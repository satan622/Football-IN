package com.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.TeamService;

@Controller
@RequestMapping("/team")
public class TeamController {
	@Inject
	private TeamService service;
	
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public void createGet(Model model) throws Exception {
		logger.info("create get...!!");
	}
}
