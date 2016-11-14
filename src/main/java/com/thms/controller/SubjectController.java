package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			
			return "redirect:/subject/listAll";
		}
	 
	 @RequestMapping(value="/listView", method=RequestMethod.GET)
		public void listView(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listView",service.listView());
		}
	 @RequestMapping(value="/listAll", method=RequestMethod.GET)
		public void listAll(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listAll",service.listAll());
		}
	 @RequestMapping(value="/readPage", method=RequestMethod.GET)
		public void readPage(@RequestParam("sjid") int sjid, Model model) throws Exception {
		 	//model.addAttribute("sjid",sjid);
		 	model.addAttribute(service.readPage(sjid));
		}
	 @RequestMapping(value="/remove", method=RequestMethod.POST)
		public String remove(@RequestParam("sjid") int sjid, RedirectAttributes rttr) throws Exception {
		 	service.delete(sjid);
		 	
		 	rttr.addFlashAttribute("msg","success");
		 	
		 	return "redirect:/subject/listAll";
		 	
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.GET)
		public void updateGET(int sjid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(sjid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
		public String updatePOST(SubjectVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("update post");
			
			service.update(vo);
			
			return "redirect:/subject/listAll";
		}
}
