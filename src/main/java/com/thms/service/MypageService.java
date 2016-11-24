package com.thms.service;

import java.util.List;

import com.thms.domain.CheckUpReservationViewVO;
import com.thms.domain.DoctorViewVO;
import com.thms.domain.ReservationViewVO;
import com.thms.domain.SearchCriteria;

public interface MypageService {
	public List<ReservationViewVO> getScheduleListByUID(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public void del(int rid) throws Exception; 
	
	public List<CheckUpReservationViewVO> listcheckupCriteria(SearchCriteria cri) throws Exception;
	public int listcheckupCount(SearchCriteria cri)throws Exception;
}