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

import com.thms.domain.CheckUpVO;
import com.thms.service.CheckUpService;

@Controller
@RequestMapping("/checkup")
public class CheckUpController {
	private static final Logger logger = LoggerFactory.getLogger(CheckUpController.class);
	
	@Inject
	private CheckUpService service;
	
	 @RequestMapping(value="/register", method=RequestMethod.GET)
		public void CheckUpGET(CheckUpVO vo, Model model) throws Exception {
		 	logger.info("input get");
		}
	 
	 @RequestMapping(value="/register", method=RequestMethod.POST)
		public String CheckUpPOST(CheckUpVO vo, Model model) throws Exception {
			logger.info("input post");
			
			service.insert(vo);
			System.out.println(vo.getChname());
			model.addAttribute("result","success");
			
			return  "redirect:/checkup/listAll";
		}
	 
	 @RequestMapping(value="/listAll", method=RequestMethod.GET)
		public void listAll(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listAll",service.listAll());
		}
	 @RequestMapping(value="/listView", method=RequestMethod.GET)
		public void listView(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listView",service.listView());
		}
	 @RequestMapping(value="/readPage", method=RequestMethod.GET)
		public void readPage(@RequestParam("chid") int chid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(chid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.GET)
		public void updateGET(int chid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(chid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
		public String updatePOST(CheckUpVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("update post");
			
			service.update(vo);
			
			return "redirect:/checkup/listAll";
		}
	 @RequestMapping(value="/remove", method=RequestMethod.POST)
		public String remove(@RequestParam("chid") int chid, RedirectAttributes rttr) throws Exception {
		 	service.delete(chid);
		 	
		 	rttr.addFlashAttribute("msg","success");
		 	
		 	return "redirect:/checkup/listAll";
		 	
		}

}
