package com.spring.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		model.addAttribute(service.detail(mno));
		return "/matches/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/score/{mno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("mno") Integer mno, @RequestBody MatchVO matchVO){
		ResponseEntity<String> entity = null;
		
		try {
			matchVO.setMno(mno);
			service.updateScore(matchVO);
			
			MatchVO match = service.detail(mno);
			
			logger.info("home: " + match.getHome() + "score: " + matchVO.getHscore() + " : " + matchVO.getAscore());
			logger.info("away: " + match.getAway() + "score: " + matchVO.getAscore() + " : " + matchVO.getHscore());
			service.goals(matchVO.getHscore(), matchVO.getAscore(), match.getHome());
			service.goals(matchVO.getAscore(), matchVO.getHscore(), match.getAway());
			
			if(matchVO.getHscore() > matchVO.getAscore()) {
				logger.info("H win");
				service.win(match.getHome());
				service.lose(match.getAway());
			}else if(matchVO.getHscore() < matchVO.getAscore()) {
				logger.info("H lose");
				service.lose(match.getHome());
				service.win(match.getAway());
			}else {
				logger.info("draw");
				service.draw(match.getHome());
				service.draw(match.getAway());
			}
			
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
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
