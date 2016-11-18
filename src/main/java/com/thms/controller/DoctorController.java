package com.thms.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.PageMaker;
import com.thms.domain.SearchCriteria;
import com.thms.domain.SubjectVO;
import com.thms.service.DoctorService;

@Controller
@RequestMapping("/doctor/*")
public class DoctorController {
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);

	@Inject
	private DoctorService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void DoctorGET(DoctorVO vo, Model model) throws Exception {
		logger.info("input get");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String DoctorPOST(DoctorVO vo, Model model) throws Exception {
		logger.info("input post");
		logger.info(vo.toString());

		service.insert(vo);
		model.addAttribute("result", "success");

		return "redirect:/doctor/list";
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
	public void readPage(@RequestParam("did") int did, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {
		service.delete(did);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
	}


	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void updateGET(int did, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.readPage(did));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String updatePOST(DoctorVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/doctor/list";
	}
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public void remove(@RequestParam("did") int did, SearchCriteria cri, RedirectAttributes rttr)throws Exception {
		service.delete(did);
		
	}
}
