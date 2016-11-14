package com.thms.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.ReservationVO;
import com.thms.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	private ReservationDAO dao;

	@Override
	public void add(ReservationVO vo) throws Exception {
		dao.add(vo);
	}
}
