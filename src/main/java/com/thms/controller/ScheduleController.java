package com.thms.controller;

import java.util.Calendar;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thms.domain.ScheduleVO;
import com.thms.service.BoardService;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	@Inject
	private BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendarGET(ScheduleVO vo) throws Exception {
		logger.info("doctor schedule calendar called..........");

		Calendar cal = Calendar.getInstance();
	}
}
