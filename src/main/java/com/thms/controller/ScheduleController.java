package com.thms.controller;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thms.domain.DoctorVO;
import com.thms.domain.ScheduleVO;
import com.thms.domain.SubjectVO;
import com.thms.persistence.SubjectDAO;
import com.thms.service.DoctorService;
import com.thms.service.ScheduleService;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	@Inject
	private ScheduleService scheduleService;

	@Inject
	private SubjectDAO subjectDao;

	@Inject
	private DoctorService doctorService;

	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@RequestMapping(value="/before", method=RequestMethod.GET)
	public String before(ScheduleVO vo, RedirectAttributes rttr) throws Exception {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;

		rttr.addFlashAttribute(vo);

		return "redirect:/schedule/calendar?year="+ year +"&month="+ month;
	}

	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendarGET(ScheduleVO vo, Integer year, Integer month, Model model) throws Exception {
		logger.info("doctor schedule calendar called..........");
		List<SubjectVO> subjectArray = subjectDao.listView();

		Calendar cal = Calendar.getInstance();

	    // 날짜 데이터 배열
	    String[][] calDate = new String[6][7];

	    // Calendar에 년,월,일 셋팅
	    if(year > 0)
	    	cal.set(Calendar.YEAR, year);
	    if(month > 0)
	    	cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DATE, 1);

        //월의 시작일이 무슨 요일인지 확인
        int startDay = cal.get(Calendar.DAY_OF_WEEK);
        //해당 월이 몇일까지 있는지 확인
        int endDay = cal.getActualMaximum(Calendar.DATE);

        int k = 0;
        for(int i=0; i<calDate.length; i++) {
        	for(int j=0; j<calDate[i].length; j++) {
        		if(k > 0)
        			k++;

        		if(i == 0) {//월의 첫째주
        			if(j + 1 == startDay)
        				k++;

        			if(k > 0)
        				calDate[i][j] = String.valueOf(k);
        			else
        				calDate[i][j] = "";
        		} else {
        			if(k <= endDay)
        				calDate[i][j] = String.valueOf(k);
        			else
        				calDate[i][j] = "";
        		}
        	}
        }

        model.addAttribute("calDate", calDate);
        model.addAttribute("year", cal.get(Calendar.YEAR));
        model.addAttribute("month", cal.get(Calendar.MONTH) + 1);
        model.addAttribute("subject", subjectArray);
	}

	@RequestMapping("/doctorList/{sjid}")
	@ResponseBody
	public List<DoctorVO> doctorList(@PathVariable("sjid") Integer sjid) throws Exception {
		return doctorService.listView(sjid);
	}
}
