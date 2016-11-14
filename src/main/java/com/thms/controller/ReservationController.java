package com.thms.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thms.domain.ReservationVO;
import com.thms.service.ReservationService;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	@Inject
	private ReservationService reservationService;

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void addGET(Model model) throws Exception {
		
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void addPOST(ReservationVO vo, RedirectAttributes rttr) throws Exception {
		reservationService.add(vo);

		rttr.addFlashAttribute("msg", "저장됐습니다.");
	}
}
