package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thms.domain.SubjectVO;
import com.thms.service.DoctorService;
import com.thms.service.IntroduceService;

@Controller
@RequestMapping("/introduce/*")
public class IntroduceController {
	@Inject
	private IntroduceService service;
	
	private static final Logger logger = LoggerFactory.getLogger(IntroduceController.class); 
	
	@RequestMapping(value = "/doctor", method = RequestMethod.GET)
	public void introduceDoctor(Model model) throws Exception{
		logger.info("get IntroduceDoctor....................");
		
		model.addAttribute("subjectList", service.subjectList());
		model.addAttribute("doctorList", service.doctorList());
//		model.addAttribute("doctorList", service.doctorList());
	}
	
	@RequestMapping(value = "/hospital", method = RequestMethod.GET)
	public void introduceHospital() {
		logger.info("GET introduceHospital....................");
	}	
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public void introduceHistory() {
		logger.info("GET introduceHistory....................");
	}
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public void introduceLocation() {
		logger.info("GET introduceLocation....................");
	}
}
