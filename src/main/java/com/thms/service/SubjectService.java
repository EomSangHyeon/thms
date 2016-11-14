package com.thms.service;

import java.util.List;

import com.thms.domain.SubjectVO;

public interface SubjectService {
	public void input(SubjectVO vo) throws Exception;
	
	public SubjectVO readPage(Integer sjid) throws Exception;
	
	public List<SubjectVO> listView() throws Exception;
	
	public List<SubjectVO> listAll() throws Exception;
	
	public void update(SubjectVO vo)throws Exception;
	
	public void delete(Integer sjid) throws Exception;
}
