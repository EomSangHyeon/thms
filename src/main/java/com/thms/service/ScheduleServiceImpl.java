package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.ScheduleVO;
import com.thms.persistence.ScheduleDAO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Inject
	private ScheduleDAO dao;

	@Override
	public List<ScheduleVO> calendar(ScheduleVO vo) throws Exception {
		return dao.calendar(vo);
	}

	@Override
	public void add(ScheduleVO vo) throws Exception {
		dao.add(vo);
	}
}
