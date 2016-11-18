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

import com.thms.domain.PageMaker;
import com.thms.domain.SearchCriteria;
import com.thms.domain.SubjectVO;
import com.thms.service.SubjectService;


@Controller
@RequestMapping("/subject/*")
public class SubjectController {
	
	 private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);
	
	 @Inject
	 private SubjectService service;
	 
	 @RequestMapping(value="/listView", method=RequestMethod.GET)
		public void listView(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 	model.addAttribute("listView", service.listSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
		}
	 
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void subjectGET(SubjectVO vo, Model model) throws Exception {
			logger.info("input get");
		}

		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String subjectPOST(SubjectVO vo, Model model) throws Exception {
			logger.info("input post");
			logger.info(vo.toString());

			service.input(vo);
			model.addAttribute("result", "success");

			return "redirect:/subject/list";
		}

		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
			logger.info(cri.toString());
			
			model.addAttribute("list", service.listSearchCriteria(cri));
				
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listSearchCount(cri));

			model.addAttribute("pageMaker", pageMaker);
		}

		@RequestMapping(value = "/readPage", method = RequestMethod.GET)
		public void readPage(@RequestParam("sjid") int sjid, @ModelAttribute("cri") SearchCriteria cri, Model model)
				throws Exception {
			model.addAttribute(service.readPage(sjid));
		}

		@ResponseBody
		@RequestMapping(value = "/remove", method = RequestMethod.POST)
		public void remove(@RequestParam("sjid") int sjid, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
			service.delete(sjid);
			
		}

		@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
		public void updateGET(int sjid, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
			model.addAttribute(service.readPage(sjid));
		}

		@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
		public String updatePOST(SubjectVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

			service.update(vo);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			return "redirect:/subject/list";
		}
}
