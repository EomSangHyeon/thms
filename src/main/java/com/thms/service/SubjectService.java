package com.thms.service;

import java.util.List;

import com.thms.domain.SubjectVO;

public interface SubjectService {
	public void input(SubjectVO vo) throws Exception;
	
	public List<SubjectVO> listView() throws Exception;
}
