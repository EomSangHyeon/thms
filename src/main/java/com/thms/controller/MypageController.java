package com.thms.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.PageMaker;
import com.thms.domain.SearchCriteria;
import com.thms.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	@Inject
	private MypageService mypageService;

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public void mypageEdit() {
		logger.info("GET mypageEdit....................");
	}

	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public void mypageReservation(HttpSession session, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("GET mypageReservation....................");
		MemberVO memberVo = (MemberVO) session.getAttribute("login");
		model.addAttribute("memberVo", memberVo);

		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(cri.getPage());
		searchCriteria.setPerPageNum(cri.getPerPageNum());
		searchCriteria.setSearchType("uid");
		searchCriteria.setKeyword(memberVo.getUid());

		model.addAttribute("reservationList", mypageService.getScheduleListByUID(searchCriteria));

		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(mypageService.listSearchCount(searchCriteria));

	    model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value="/reservation", method=RequestMethod.POST)
	@ResponseBody
	public String reservationPOST(@RequestParam("rid") int rid) throws Exception {
		mypageService.del(rid);

		return "success";
	}

	@RequestMapping(value = "/checkup", method = RequestMethod.GET)
	public void mypageCheckup() {
		logger.info("GET mypageCheckup....................");
	}

	@RequestMapping(value = "/hospitalize", method = RequestMethod.GET)
	public void mypageHospitalize(HttpSession session, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("GET mypageHospitalize....................");
		MemberVO memberVo = (MemberVO) session.getAttribute("login");
		model.addAttribute("memberVo", memberVo);

		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(cri.getPage());
		searchCriteria.setPerPageNum(cri.getPerPageNum());
		searchCriteria.setSearchType("uid");
		searchCriteria.setKeyword(memberVo.getUid());

		model.addAttribute("hospitalizeList", mypageService.getHospitalizeListByUID(searchCriteria));

		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(mypageService.listHospitalizeCount(searchCriteria));

	    model.addAttribute("pageMaker", pageMaker);
	}
}