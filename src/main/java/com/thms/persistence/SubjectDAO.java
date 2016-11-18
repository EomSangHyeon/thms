package com.thms.persistence;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.SearchCriteria;
import com.thms.domain.SubjectVO;

public interface SubjectDAO {
	public void input(SubjectVO vo) throws Exception;
	
	public SubjectVO readPage(Integer sjid) throws Exception;
	
	public List<SubjectVO> listView() throws Exception;
	
	public List<SubjectVO> listAll() throws Exception;
	
	public void update(SubjectVO vo)throws Exception;
	
	public void delete(Integer sjid) throws Exception;
	
	public List<SubjectVO> listPage(int page) throws Exception;

	public List<SubjectVO> listCriteria(Criteria cri) throws Exception;
	
	public List<SubjectVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
}
