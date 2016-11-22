package com.thms.persistence;

import java.util.List;

import com.thms.domain.ReservationVO;
import com.thms.dto.ReservationDTO;

public interface ReservationDAO {
	public void add(ReservationVO vo) throws Exception;
	public List<ReservationVO> getScheduleList(ReservationDTO dto) throws Exception;
}
