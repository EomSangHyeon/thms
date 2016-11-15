package com.thms.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
import com.thms.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("cri") SearchCriteria cri, Locale locale, Model model) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );	
		
		logger.info(cri.toString());

    model.addAttribute("list", service.listSearchCriteria(cri));
    model.addAttribute("nlist", service.listNewsSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setDisplayPageNum(8);
    pageMaker.setCri(cri);    
    pageMaker.setTotalCount(service.listSearchCount(cri));    

    model.addAttribute("pageMaker", pageMaker);
		
		return "home";
	}
	
}