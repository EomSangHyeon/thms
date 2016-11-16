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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.PageMaker;
import com.thms.domain.SubjectVO;
import com.thms.service.DoctorService;

@Controller
@RequestMapping("/doctor")
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

		return "redirect:/doctor/listAll";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		logger.info("Show all");
		model.addAttribute("listAll", service.listAll());
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("did") int did, @ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		model.addAttribute(service.readPage(did));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void updateGET(int did,@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		model.addAttribute(service.readPage(did));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String updatePOST(DoctorVO vo,Criteria cri, RedirectAttributes rttr) throws Exception {

		service.update(vo);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		return "redirect:/doctor/listPage";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("did") int did, Criteria cri,RedirectAttributes rttr) throws Exception {
		service.delete(did);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPage",cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/doctor/listPage";

	}

	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception {
		logger.info("Show all");
		System.out.println(cri);
		model.addAttribute("listCri", service.listCriteria(cri));
	}

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) throws Exception {
		logger.info(cri.toString());

		model.addAttribute("listPage", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(cri);
		pageMaker.setTotalCount(service.listCountCreiteria(cri));
		
		System.out.println(pageMaker.getStartPage() + " " + pageMaker.getEndPage());
		model.addAttribute("pageMaker", pageMaker);
	}

}
