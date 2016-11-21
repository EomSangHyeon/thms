package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.ReservationVO;
import com.thms.dto.ReservationDTO;
import com.thms.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	private ReservationDAO dao;

	@Override
	public void add(ReservationVO vo) throws Exception {
		dao.add(vo);
	}

	@Override
	public List<ReservationVO> getScheduleList(ReservationDTO dto) throws Exception {
		return dao.getScheduleList(dto);
	}
}
