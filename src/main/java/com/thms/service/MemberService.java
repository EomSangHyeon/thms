package com.thms.service;

import com.thms.domain.MemberVO;
import com.thms.dto.LoginDTO;

public interface MemberService {
	public MemberVO login(LoginDTO dto) throws Exception;
}
