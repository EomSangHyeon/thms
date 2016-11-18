package com.thms.service;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.RoomVO;
import com.thms.domain.SearchCriteria;

public interface RoomService {
	public void insert(RoomVO vo) throws Exception;
	
	public RoomVO readPage(Integer rmid) throws Exception;
	
	public List<RoomVO> listAll() throws Exception;
	
	public void update(RoomVO vo)throws Exception;
	
	public void delete(Integer rmid) throws Exception;
	
	public List<RoomVO> listCriteria(Criteria cri) throws Exception;	
	
	public int listCountCreiteria(Criteria cri) throws Exception;
	
	public List<RoomVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
