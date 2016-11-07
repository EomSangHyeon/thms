package com.thms.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.MemberVO;
import com.thms.dto.LoginDTO;
import com.thms.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
}
