package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thms.domain.CheckUpReservationVO;
import com.thms.domain.PageMaker;
import com.thms.domain.SearchCriteria;
import com.thms.service.CheckUpReservationService;

@Controller
@RequestMapping("/checkupreservation/*")
public class CheckUpReservationController {
	private static final Logger logger = LoggerFactory.getLogger(CheckUpReservationController.class);
	
	@Inject
	private CheckUpReservationService service;
	 @RequestMapping(value="/register", method=RequestMethod.GET)
		public void ReservationGET(CheckUpReservationVO vo, Model model) throws Exception {
		 	logger.info("input get");
		}
	 
	 @RequestMapping(value="/register", method=RequestMethod.POST)
		public String ReservationPOST(CheckUpReservationVO vo, Model model) throws Exception {
			logger.info("input post");
			
			service.insert(vo);
			model.addAttribute("result","success");
			
			return  "redirect:/checkupreservation/list";
		}
	 @RequestMapping(value="/list", method=RequestMethod.GET)
		public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute("list", service.listSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
		}
	 
		@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
		public void updateGET(int creid, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
			model.addAttribute(service.readPage(creid));
		}

		@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
		public String updatePOST(CheckUpReservationVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

			service.update(vo);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			return "redirect:/checkupreservation/list";
		}
	 
	 @RequestMapping(value="/memberList", method=RequestMethod.GET)
		public void memList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute("memberList", service.memlistSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.memlistSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
		}
	 @ResponseBody
		@RequestMapping(value = "/remove", method = RequestMethod.POST)
		public void remove(@RequestParam("creid") int creid, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
			service.delete(creid);
			
		}
	 @RequestMapping(value="/checkupList", method=RequestMethod.GET)
		public void checkupList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute("checkupList", service.checkuplistSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.checkuplistSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
		}
	 @RequestMapping(value="/checkuproomList", method=RequestMethod.GET)
		public void checkuproomList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute("checkuproomList", service.checkuproomlistSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.checkuproomlistSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
		}
	 
	 
	 
}
