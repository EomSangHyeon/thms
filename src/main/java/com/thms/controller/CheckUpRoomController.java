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

import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.domain.PageMaker;
import com.thms.domain.SearchCriteria;
import com.thms.service.CheckUpRoomService;

@Controller
@RequestMapping("/checkuproom/*")
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
			
			return  "redirect:/checkuproom/list";
		}
	 
	 @RequestMapping(value="/list", method=RequestMethod.GET)
		public void listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 model.addAttribute("list", service.listSearchCriteria(cri));

		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(service.listSearchCount(cri));

		    model.addAttribute("pageMaker", pageMaker);
		}
	 @RequestMapping(value="/readPage", method=RequestMethod.GET)
		public void readPage(@RequestParam("crid") int crid,@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute(service.readPage(crid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.GET)
		public void updateGET(int crid,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute(service.readPage(crid));
		}
	 @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
		public String updatePOST(CheckUpRoomVO vo, SearchCriteria cri,RedirectAttributes rttr) throws Exception {
			logger.info("update post");
			
			service.update(vo);
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("searchType",cri.getSearchType());
			rttr.addAttribute("keyword",cri.getKeyword());
			return "redirect:/checkuproom/list";
		}

	 @ResponseBody
		@RequestMapping(value = "/remove", method = RequestMethod.POST)
		public void remove(@RequestParam("crid") int crid, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
			service.delete(crid);
			
		}
}
