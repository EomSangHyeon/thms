package com.thms.service;

import java.util.List;

import com.thms.domain.DoctorVO;
import com.thms.domain.SubjectVO;

public interface IntroduceService {
	public List<SubjectVO> subjectList() throws Exception;
	
	public List<DoctorVO> doctorList() throws Exception;
}
