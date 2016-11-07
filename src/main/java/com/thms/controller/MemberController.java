package com.thms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		logger.info("GET login....................");
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join() {
		logger.info("GET join....................");
	}
}
