package com.thms.persistence;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.DoctorViewVO;
import com.thms.domain.SearchCriteria;

public interface DoctorDAO {
	public void insert(DoctorVO vo) throws Exception;

	public List<DoctorVO> listView(Integer sjid) throws Exception;

	public DoctorVO readPage(Integer did) throws Exception;

	public List<DoctorVO> listAll() throws Exception;

	public void update(DoctorVO vo) throws Exception;

	public void delete(Integer did) throws Exception;

	public List<DoctorVO> listPage(int page) throws Exception;

	public List<DoctorVO> listCriteria(Criteria cri) throws Exception;
	
	public List<DoctorViewVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	
}
