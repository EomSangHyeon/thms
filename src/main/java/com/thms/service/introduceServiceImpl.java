package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.DoctorVO;
import com.thms.domain.SubjectVO;
import com.thms.persistence.IntroduceDAO;

@Service
public class introduceServiceImpl implements IntroduceService {
	
	@Inject
	IntroduceDAO dao;

	@Override
	public List<SubjectVO> subjectList() throws Exception {
		return dao.subjectList();
	}

	@Override
	public List<DoctorVO> doctorList() throws Exception {
		return dao.doctorList();
	}

}
