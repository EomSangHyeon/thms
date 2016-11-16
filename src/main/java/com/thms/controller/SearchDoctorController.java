package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thms.domain.PageMaker;
import com.thms.domain.SearchCriteria;
import com.thms.service.DoctorService;

@Controller
@RequestMapping("/doctor/*")
public class SearchDoctorController {

	@Inject
	private DoctorService service;

	private static final Logger logger = LoggerFactory.getLogger(SearchDoctorController.class);
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	    logger.info(cri.toString());

	    model.addAttribute("list", service.listCriteria(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.listCountCreiteria(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
}
