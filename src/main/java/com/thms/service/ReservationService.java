package com.thms.service;

import java.util.List;

import com.thms.domain.ReservationVO;
import com.thms.domain.ReservationViewVO;
import com.thms.domain.SearchCriteria;
import com.thms.dto.ReservationDTO;

public interface ReservationService {
	public void add(ReservationVO vo) throws Exception;
	public List<ReservationVO> getScheduleList(ReservationDTO dto) throws Exception;

	public List<ReservationViewVO> getScheduleListByUID(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	public void del(int rid) throws Exception; 
}
