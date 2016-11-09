package com.thms.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thms.domain.MemberVO;
import com.thms.dto.LoginDTO;
import com.thms.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		
	}

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(dto);
		if(vo == null)
			return;

		model.addAttribute("memberVO", vo);
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void memberJoin() {
		logger.info("GET memberJoin....................");
	}
}
