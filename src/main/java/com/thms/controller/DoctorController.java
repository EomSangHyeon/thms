package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thms.domain.DoctorVO;
import com.thms.service.DoctorService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);
	
	 @Inject
	 private DoctorService service;
	 
	 @RequestMapping(value="/register", method=RequestMethod.GET)
		public void DoctorGET(DoctorVO vo, Model model) throws Exception {
		 	logger.info("input get");
		}
	 
	 @RequestMapping(value="/register", method=RequestMethod.POST)
		public String DoctorPOST(DoctorVO vo, Model model) throws Exception {
			logger.info("input post");
			logger.info(vo.toString());
			logger.info(vo.getDname());
			logger.info(vo.getDgender());
			logger.info(vo.getDclinic());
			logger.info(vo.toString());
			
	//		service.insert(vo);
			model.addAttribute("result","success");
			
			return "/doctor/check";
		}
}
