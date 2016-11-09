package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}
