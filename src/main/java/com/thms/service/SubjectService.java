package com.thms.service;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.RoomVO;
import com.thms.domain.SearchCriteria;
import com.thms.domain.SubjectVO;

public interface SubjectService {
	public void input(SubjectVO vo) throws Exception;
	
	public SubjectVO readPage(Integer sjid) throws Exception;
	
	public List<SubjectVO> listView() throws Exception;
	
	public List<SubjectVO> listAll() throws Exception;
	
	public void update(SubjectVO vo)throws Exception;
	
	public void delete(Integer sjid) throws Exception;
	
	public List<SubjectVO> listCriteria(Criteria cri) throws Exception;	
	
	public int listCountCreiteria(Criteria cri) throws Exception;
	
	public List<SubjectVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
