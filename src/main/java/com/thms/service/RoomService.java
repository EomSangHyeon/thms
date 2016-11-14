package com.thms.service;

import java.util.List;

import com.thms.domain.MemberVO;
import com.thms.domain.RoomVO;

public interface RoomService {
	public void insert(RoomVO vo) throws Exception;
	
	public RoomVO readPage(Integer rmid) throws Exception;
	
	public List<RoomVO> listAll() throws Exception;
	
	public void update(RoomVO vo)throws Exception;
	
	public void delete(Integer rmid) throws Exception;
}
