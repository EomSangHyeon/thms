package com.thms.service;

import java.util.List;

import com.thms.domain.CheckUpRoomVO;

public interface CheckUpRoomService {
	public void insert(CheckUpRoomVO vo) throws Exception;
	
	public CheckUpRoomVO readPage(Integer crid) throws Exception;
	
	public List<CheckUpRoomVO> listAll() throws Exception;

	public void update(CheckUpRoomVO vo)throws Exception;
	
	public void delete(Integer crid) throws Exception;
}
