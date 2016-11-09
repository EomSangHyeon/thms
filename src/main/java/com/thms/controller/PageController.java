package com.thms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	// member
	/*@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public void memberLogin() {
		logger.info("GET memberLogin....................");
	}	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public void memberJoin() {
		logger.info("GET memberJoin....................");
	}	
	@RequestMapping(value = "/member/id", method = RequestMethod.GET)
	public void memberId() {
		logger.info("GET memberId....................");
	}	
	@RequestMapping(value = "/member/pw", method = RequestMethod.GET)
	public void memberPw() {
		logger.info("GET memberPw....................");
	}*/
	
	// mypage
	@RequestMapping(value = "/mypage/edit", method = RequestMethod.GET)
	public void mypageEdit() {
		logger.info("GET mypageEdit....................");
	}	
	@RequestMapping(value = "/mypage/reservation", method = RequestMethod.GET)
	public void mypageReservation() {
		logger.info("GET mypageReservation....................");
	}
	
	// introduce
	@RequestMapping(value = "/introduce/hospital", method = RequestMethod.GET)
	public void introduceHospital() {
		logger.info("GET introduceHospital....................");
	}
	@RequestMapping(value = "/introduce/doctor ", method = RequestMethod.GET)
	public void introduceDoctor () {
		logger.info("GET introduceDoctor....................");
	}
	@RequestMapping(value = "/introduce/history", method = RequestMethod.GET)
	public void introduceHistory() {
		logger.info("GET introduceHistory....................");
	}
	@RequestMapping(value = "/introduce/location", method = RequestMethod.GET)
	public void introduceLocation() {
		logger.info("GET introduceLocation....................");
	}
	
	//admin
	@RequestMapping(value = "admin/doctor/register", method = RequestMethod.GET)
	public void adminDoctorRegister() {
		logger.info("GET adminDoctorRegister....................");
	}
}