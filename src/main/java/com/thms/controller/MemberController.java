package com.thms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thms.domain.MemberVO;
import com.thms.domain.PageMaker;
import com.thms.domain.PatientVO;
import com.thms.domain.SearchCriteria;
import com.thms.dto.LoginDTO;
import com.thms.persistence.JoinDAOImpl;
import com.thms.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	// ===================hong
	@Inject
	JoinDAOImpl dao;

	@Autowired
	protected JavaMailSender mailSender;

	// ajax로 입력하는 방이 입실 가능한지 안한지 여부검사
	@ResponseBody
	@RequestMapping(value ="restRoomAjax"  ,produces = "application/text; charset=utf8" )
	public ResponseEntity<String> aviliableRoom(@RequestParam("rmid") String rmid) {
		String here = dao.checkRoom(rmid);
		if (Integer.parseInt(here) > 0) {
			here = here+"명 입실 가능";
		}else{
			here = here+" 입실 불가";
		}

		ResponseEntity<String> entity = new ResponseEntity<String>(here, HttpStatus.OK);

		return entity;
	}

	// 방 현황 확인
	@RequestMapping("roomList")
	public void RoomList(Model model) {

		model.addAttribute("room", dao.currentRoom());
		System.out.println(dao.currentRoom());
	}

	// 아이작스로 환자 삭제
	@ResponseBody
	@RequestMapping(value = "deleteAjax.do", method = RequestMethod.POST)
	public String deletePatient(@RequestParam("hoid") String hoid) {
		System.out.println("deleteAjax.do");
		System.out.println(hoid);
		dao.deletePatient(hoid);

		return "ok";
	}

	// 방 확정 시키기 위함
	@ResponseBody
	@RequestMapping(value = "updateConfirmRoom.do", method = RequestMethod.POST)
	public String updateRoom(PatientVO vo) {
		System.out.println("updateConfirmRoom");
		dao.updatePatient(vo);
		return "oo";
	}

	// 방 넣기 위해서 환자 한명의 값을 불러옴
	@RequestMapping("confirmRoom")
	public void confirmRoom(@RequestParam("hoid") int hoid, Model model) {
		System.out.println("confirmRoom");
		System.out.println(hoid);

		model.addAttribute("here", dao.selectOnePatient(String.valueOf(hoid)));

	}

	// 환자 전체 리스트 불러오기 // 환자 검색해서 리스트 불러오기
	@RequestMapping("testselectPatientList")
	public void selectPatientList(SearchCriteria cri, Model model) {
		System.out.println("testselectPatientList");

		if (cri.getSearchType() == null) {

			model.addAttribute("list", dao.selectPatientList(cri));
			PageMaker maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(dao.searchTotalPatient());
			model.addAttribute("pageMaker", maker);
		} else if (cri.getSearchType() == "") {

			model.addAttribute("list", dao.selectPatientList(cri));
			PageMaker maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(dao.searchTotalPatient());
			model.addAttribute("pageMaker", maker);
		} else if (cri.getSearchType() != null || cri.getSearchType() != "") {

			model.addAttribute("list", dao.searchPatientList(cri));
			List al = new ArrayList();
			al = dao.searchPatientList(cri);
			PageMaker maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(al.size());
			model.addAttribute("pageMaker", maker);

		}

	}

	// 환자 입력을 수행
	@RequestMapping("joinForPatient.do")
	public String joinConfirmPatient(PatientVO vo) {
		dao.joinForPatient(vo);
		return "direct:/selectPatientList";

	}

	// 환자 입력을 위한 검색
	@RequestMapping("testJoinPatient")
	public void joinPatient() {

	}

	// 환자 입력할때 아이디 확인
	@RequestMapping("ajaxForPatientUid")
	public ResponseEntity<List> forPatient(HttpServletRequest request, Model model) {
		System.out.println("ajaxForPatientUid");
		String uid = request.getParameter("uid");
		System.out.println(uid);

		System.out.println(dao.selectSearchForPatientUid(uid));
		List<String> lista = new ArrayList<String>();
		lista.addAll(dao.selectSearchForPatientUid(uid));

		ResponseEntity<List> entity = new ResponseEntity<List>(lista, HttpStatus.OK);

		return entity;

	}

	// 회원 검색
	@RequestMapping(value = "testSearch")
	public void search() {
	}

	// 유저들 검색 결과를 가져오기
	@RequestMapping(value = "testSearchResult")
	public void listPage(SearchCriteria cri, Model model) {

		model.addAttribute("searchmember", dao.listCriteria(cri));

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(dao.searchTotal(cri));

		model.addAttribute("pageMaker", maker);

	}

	// ajax를 통한 관리자 인지 아닌지
	@ResponseBody
	@RequestMapping(value = "ajaxForUstatus", method = RequestMethod.POST)
	public ResponseEntity<String> ajaxForUstatus(HttpServletRequest request) {
		System.out.println("ajaxForUstatus");

		ResponseEntity<String> entity = null;

		if (request.getParameter("ustatus").equals("admin") || request.getParameter("ustatus").equals("master")) {

			entity = new ResponseEntity<String>("O", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("X", HttpStatus.OK);
		}
		return entity;
	}

	// 회원정보수정
	@RequestMapping(value = "testMemberModify")
	public void memberModify(HttpServletRequest request, Model model) {
		System.out.println("modify member");

		// 한개 정보 들고오기
		model.addAttribute("searchmember", dao.selectOneMember(request.getParameter("uid")));
		model.addAttribute("Custatus", request.getParameter("ustatus"));
	}

	// 정보 수정 확정
	@RequestMapping(value = "confirmUpdateMember", method = RequestMethod.POST)
	public String confirmUpdateMember(MemberVO vo) {
		System.out.println("confirmUpdate");

		dao.memberModify(vo);
		return "redirect:/";
	}

	/* @RequestMapping(value="yesUpdateMember" ) */
	// 권한주기
	@RequestMapping(value = "statusModify", method = RequestMethod.POST)
	public void statusModify(MemberVO vo) {
		System.out.println("status modify");
		dao.statusModify(vo);
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void memberJoin() {

		logger.info("memberJoin..............");
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String memberJoin(MemberVO vo) {
		System.out.println("join");

		dao.memberJoin(vo);

		return "redirect:/";
	}

	// 아이디 닉네임 검사  produces = "application/text; charset=utf8"  아이작스 한글 로 보내줌
	@ResponseBody
	@RequestMapping(value = "checkId", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> checkId(HttpServletRequest request, Model model) throws Exception {

		System.out.println("ajax");

		String aa = request.getParameter("id1");
		String bb = request.getParameter("unick");

		ResponseEntity<String> entity = null;

		if (aa != null) {

			System.out.println(aa);

			if (dao.checkUid(aa) == null) {
				entity = new ResponseEntity<String>("O", HttpStatus.OK);
				return entity;
			} else {
				entity = new ResponseEntity<String>(" X(아이디 중복)", HttpStatus.OK);
				return entity;
			}

		} else if (bb != null) {
			System.out.println(bb);
			if (dao.checkUnick(bb) == null) {

				entity = new ResponseEntity<String>("O", HttpStatus.OK);
				return entity;
			} else {
				entity = new ResponseEntity<String>(" X(아이디 중복)", HttpStatus.OK);
				return entity;
			}

		}
		return null;
	}

	// 메일보내기
	@ResponseBody
	@RequestMapping(value = "ajaxsend", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> sendEmailAction(HttpServletRequest request) throws Exception {
		String uemail = request.getParameter("uemail");

		// 메일 내용을 작성한다
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("ju583830@gmail.com");
		msg.setTo(new String[] { uemail });

		ResponseEntity<String> entity = null;

		try {
			Random random = new Random();

			int number = random.nextInt(10000) + 1000;

			if (number > 10000) {
				number = number - 1000;
			}

			msg.setSubject("인증 메일입니다.");
			msg.setText(number + " 숫자 인증해주세요");

			mailSender.send(msg);
			return entity = new ResponseEntity<String>(number + "", HttpStatus.OK);

		} catch (MailException ex) {
			System.out.println("실패");
			return null;
		}

	}

	// ===========================================

	@Inject
	private MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(dto);
		if (vo == null)
			return;

		model.addAttribute("memberVO", vo);
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) throws Exception {
		logger.info("로그아웃 하셔씀");
		session.removeAttribute("login");

		return "redirect:/";
	}
}