package com.thms.service;

import java.util.List;

import com.thms.domain.DoctorVO;

public interface DoctorService {
	public void insert(DoctorVO vo) throws Exception;
	public List<DoctorVO> listView(Integer sjid) throws Exception;
}
