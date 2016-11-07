package com.thms.persistence;

import com.thms.domain.MemberVO;
import com.thms.dto.LoginDTO;

public interface MemberDAO {
	public MemberVO login(LoginDTO dto) throws Exception;
}
