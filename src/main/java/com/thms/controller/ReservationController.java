package com.thms.controller;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thms.domain.CalendarCriteria;
import com.thms.domain.ReservationVO;
import com.thms.domain.ScheduleVO;
import com.thms.domain.SubjectVO;
import com.thms.persistence.SubjectDAO;
import com.thms.service.ReservationService;
import com.thms.service.ScheduleService;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	@Inject
	private ReservationService reservationService;

	@Inject
	private ScheduleService scheduleService;

	@Inject
	private SubjectDAO subjectDao;

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void addGET(ScheduleVO vo, CalendarCriteria cri, Model model) throws Exception {
		logger.info("doctor schedule calendar called..........");
		List<SubjectVO> subjectArray = subjectDao.listView();

		Calendar cal = Calendar.getInstance();

		// 날짜 데이터 배열
		String[][] calDate = new String[6][7];

		// Calendar에 년,월,일 셋팅
		if (cri.getYear() > 0)
			cal.set(Calendar.YEAR, cri.getYear());
		if (cri.getMonth() > 0)
			cal.set(Calendar.MONTH, cri.getMonth() - 1);
		cal.set(Calendar.DATE, 1);

		// 월의 시작일이 무슨 요일인지 확인
		int startDay = cal.get(Calendar.DAY_OF_WEEK);
		// 해당 월이 몇일까지 있는지 확인
		int endDay = cal.getActualMaximum(Calendar.DATE);

		int k = 0;
		for (int i = 0; i < calDate.length; i++) {
			for (int j = 0; j < calDate[i].length; j++) {
				if (k > 0)
					k++;

				if (i == 0) {// 월의 첫째주
					if (j + 1 == startDay)
						k++;

					if (k > 0)
						calDate[i][j] = String.valueOf(k);
					else
						calDate[i][j] = "";
				} else {
					if (k <= endDay)
						calDate[i][j] = String.valueOf(k);
					else
						calDate[i][j] = "";
				}
			}
		}

		if (vo != null) {
			List<ScheduleVO> scheduleList = scheduleService.calendar(vo);

			int[][] medicalCount = new int[7][2];
			int weekDay = 0, ampm = 0;
			for (int i = 0; i < scheduleList.size(); i++) {
				switch (scheduleList.get(i).getWeekday()) {
				case "Sun":
					weekDay = 0;
					break;
				case "Mon":
					weekDay = 1;
					break;
				case "Tue":
					weekDay = 2;
					break;
				case "Wed":
					weekDay = 3;
					break;
				case "Thr":
					weekDay = 4;
					break;
				case "Fri":
					weekDay = 5;
					break;
				case "Sat":
					weekDay = 6;
					break;
				}
				if (scheduleList.get(i).getAmpm().equals("am"))
					ampm = 0;
				else
					ampm = 1;

				medicalCount[weekDay][ampm] = scheduleList.get(i).getMedicalCount();
			}

			model.addAttribute("medicalCount", medicalCount);
		}

		model.addAttribute("calDate", calDate);
		model.addAttribute("year", cal.get(Calendar.YEAR));
		model.addAttribute("month", cal.get(Calendar.MONTH) + 1);
		model.addAttribute("subject", subjectArray);
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void addPOST(ReservationVO vo, RedirectAttributes rttr) throws Exception {
		reservationService.add(vo);

		rttr.addFlashAttribute("msg", "저장됐습니다.");
	}
}
