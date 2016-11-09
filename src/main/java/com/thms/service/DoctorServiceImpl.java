package com.thms.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.DoctorVO;
import com.thms.persistence.DoctorDAO;

@Service
public class DoctorServiceImpl implements DoctorService{
	@Inject
	private	DoctorDAO dao;
	@Override
	public void insert(DoctorVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

}
