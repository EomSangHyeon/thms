package com.thms.persistence;

import java.util.List;

import com.thms.domain.SubjectVO;

public interface SubjectDAO {
	public void input(SubjectVO vo) throws Exception;
	
	public List<SubjectVO> listView() throws Exception;
}
