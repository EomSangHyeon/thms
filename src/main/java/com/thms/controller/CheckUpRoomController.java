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

import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.service.CheckUpRoomService;

@Controller
@RequestMapping("/checkuproom")
public class CheckUpRoomController {
	@Inject
	private CheckUpRoomService service;
	
	private static final Logger logger = LoggerFactory.getLogger(CheckUpRoomController.class);
	
	 @RequestMapping(value="/register", method=RequestMethod.GET)
		public void CheckUpRoomGET(CheckUpRoomVO vo, Model model) throws Exception {
		 	logger.info("input get");
		}
	 
	 @RequestMapping(value="/register", method=RequestMethod.POST)
		public String CheckUpRoomPOST(CheckUpRoomVO vo, Model model) throws Exception {
			logger.info("input post");
			
			service.insert(vo);
			model.addAttribute("result","success");
			
			return  "redirect:/checkuproom/listAll";
		}
	 
	 @RequestMapping(value="/listAll", method=RequestMethod.GET)
		public void listAll(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listAll",service.listAll());
		}
	 @RequestMapping(value="/readPage", method=RequestMethod.GET)
		public void readPage(@RequestParam("crid") int crid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(crid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.GET)
		public void updateGET(int crid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(crid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
		public String updatePOST(CheckUpRoomVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("update post");
			
			service.update(vo);
			
			return "redirect:/checkuproom/listAll";
		}
	 @RequestMapping(value="/remove", method=RequestMethod.POST)
		public String remove(@RequestParam("crid") int crid, RedirectAttributes rttr) throws Exception {
		 	service.delete(crid);
		 	
		 	rttr.addFlashAttribute("msg","success");
		 	
		 	return "redirect:/checkuproom/listAll";
		 	
		}
}
