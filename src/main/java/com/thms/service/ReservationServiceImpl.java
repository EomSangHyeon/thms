package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.ReservationVO;
import com.thms.domain.ReservationViewVO;
import com.thms.domain.SearchCriteria;
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

	@Override
	public List<ReservationViewVO> getScheduleListByUID(SearchCriteria cri) throws Exception {
		return dao.getScheduleListByUID(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void del(int rid) throws Exception {
		dao.del(rid);
	}
}
