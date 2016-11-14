package com.thms.service;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;

public interface DoctorService {
	public void insert(DoctorVO vo) throws Exception;

	public List<DoctorVO> listView(Integer sjid) throws Exception;
	
	public DoctorVO readPage(Integer did) throws Exception;
	
	public List<DoctorVO> listAll() throws Exception;
	
	public List<DoctorVO> listPage(int page) throws Exception;
	
	public List<DoctorVO> listCriteria(Criteria cri) throws Exception;	
	
	public void update(DoctorVO vo)throws Exception;
	
	public void delete(Integer did) throws Exception;
}
