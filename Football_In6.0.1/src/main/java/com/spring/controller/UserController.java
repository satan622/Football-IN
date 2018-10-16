package com.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Criteria;
import com.spring.domain.PageMaker;
import com.spring.domain.SearchCriteria;
import com.spring.domain.UserVO;
import com.spring.dto.LoginDTO;
import com.spring.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		UserVO vo = service.login(dto);
		
		if(vo == null) {
			return;
		}
		logger.info("login: "+ vo.toString());
		model.addAttribute("userVO", vo);
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
//			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
		}
		
		return "user/logout";
	}
	
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(Model model) throws Exception {
		logger.info("join get...!!");
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("join post...!!");
		logger.info(user.toString());
		
		service.join(user);
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value="/player", method = RequestMethod.GET)
	public void read(@RequestParam("uid") String uid, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(uid));
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void liatAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
}
