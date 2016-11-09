package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thms.domain.SubjectVO;
import com.thms.service.SubjectService;


@Controller
@RequestMapping("/subject")
public class SubjectController {
	
	 private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);
	
	 @Inject
	 private SubjectService service;
	 
	 @RequestMapping(value="/register", method=RequestMethod.GET)
		public void SubjectGET(SubjectVO vo, Model model) throws Exception {
		 	logger.info("input get");
		}
	 
	 @RequestMapping(value="/register", method=RequestMethod.POST)
		public String SubjectPOST(SubjectVO vo, Model model) throws Exception {
			logger.info("input post");
			logger.info(vo.toString());
			
			service.input(vo);
			model.addAttribute("result","success");
			
			return "/subject/success";
		}
	 
	 @RequestMapping(value="/listView", method=RequestMethod.GET)
		public void listView(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listView",service.listView());
		}
}
