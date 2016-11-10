package com.thms.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.thms.domain.MemberVO;
import com.thms.domain.PageMaker;
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

	// 회원 검색

	@RequestMapping(value = "testSearch")
	public void search() {
	}

	@RequestMapping(value = "testSearchResult")
	public void listPage(SearchCriteria cri, Model model) {

		model.addAttribute("searchmember", dao.listCriteria(cri));

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(dao.searchTotal(cri));

		model.addAttribute("pageMaker", maker);

	}

	// 권한주기
	@RequestMapping(value = "statusModify", method = RequestMethod.POST)
	public void statusModify(MemberVO vo) {
		System.out.println("status modify");
		dao.statusModify(vo);
	}

	// 회원정보수정
	@RequestMapping(value = "memberModify", method = RequestMethod.POST)
	public void memberModify(MemberVO vo) {
		System.out.println("modify member");

		dao.memberModify(vo);

	}

	// 회원가입
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String memberJoin(MemberVO vo) {
		System.out.println("join");

		dao.memberJoin(vo);

		return "redirect:/";
	}

	// 아이디 닉네임 검사
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

	// ===============

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

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void memberJoin() {
		logger.info("GET memberJoin....................");
	}
}
