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

import com.thms.domain.DoctorVO;
import com.thms.domain.RoomVO;
import com.thms.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Inject
	private RoomService service;
	
	 @RequestMapping(value="/register", method=RequestMethod.GET)
		public void DoctorGET(RoomVO vo, Model model) throws Exception {
		 	logger.info("input get");
		}
	 @RequestMapping(value="/register", method=RequestMethod.POST)
		public String DoctorPOST(RoomVO vo, Model model) throws Exception {
			logger.info("input post");
			logger.info(vo.toString());
			
			service.insert(vo);
			model.addAttribute("result","success");
			
			return "/room/register";
		}
	 @RequestMapping(value="/listAll", method=RequestMethod.GET)
		public void listAll(Model model) throws Exception {
		 	logger.info("Show all");
		 	model.addAttribute("listAll",service.listAll());
		}
	 @RequestMapping(value="/readPage", method=RequestMethod.GET)
		public void readPage(@RequestParam("rmid") int rmid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(rmid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.GET)
		public void updateGET(int rmid, Model model) throws Exception {
		 	model.addAttribute(service.readPage(rmid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
		public String updatePOST(RoomVO vo, RedirectAttributes rttr) throws Exception {
			logger.info("update post");
			
			service.update(vo);
			
			return "redirect:/room/listAll";
		}
	 @RequestMapping(value="/remove", method=RequestMethod.POST)
		public String remove(@RequestParam("rmid") int rmid, RedirectAttributes rttr) throws Exception {
		 	service.delete(rmid);
		 	
		 	rttr.addFlashAttribute("msg","success");
		 	
		 	return "redirect:/room/listAll";
		 	
		}

}
