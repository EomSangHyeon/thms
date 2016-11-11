package com.thms.persistence;

import java.util.List;

import com.thms.domain.DoctorVO;

public interface DoctorDAO {
	public void insert(DoctorVO vo) throws Exception;
	public List<DoctorVO> listView(Integer sjid) throws Exception;
}
