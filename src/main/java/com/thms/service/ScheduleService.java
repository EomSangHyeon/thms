package com.thms.service;

import java.util.List;

import com.thms.domain.ScheduleVO;

public interface ScheduleService {
	public List<ScheduleVO> calendar(ScheduleVO vo) throws Exception;
}
