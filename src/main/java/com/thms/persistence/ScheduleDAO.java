package com.thms.persistence;

import java.util.List;

import com.thms.domain.ScheduleVO;

public interface ScheduleDAO {
	public List<ScheduleVO> calendar(ScheduleVO vo) throws Exception;
}
