package com.thms.service;

import java.util.List;

import com.thms.domain.PatientViewVO;
import com.thms.domain.ReservationViewVO;
import com.thms.domain.SearchCriteria;

public interface MypageService {
	public List<ReservationViewVO> getScheduleListByUID(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public void del(int rid) throws Exception; 

	public List<PatientViewVO> getHospitalizeListByUID(SearchCriteria cri) throws Exception;
	public int listHospitalizeCount(SearchCriteria cri) throws Exception;
}