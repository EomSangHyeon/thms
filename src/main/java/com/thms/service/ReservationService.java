package com.thms.service;

import java.util.List;

import com.thms.domain.ReservationVO;
import com.thms.dto.ReservationDTO;

public interface ReservationService {
	public void add(ReservationVO vo) throws Exception;
	public List<ReservationVO> getScheduleList(ReservationDTO dto) throws Exception;
}
