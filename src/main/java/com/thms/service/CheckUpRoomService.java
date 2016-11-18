package com.thms.service;

import java.util.List;

import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;

public interface CheckUpRoomService {
	public void insert(CheckUpRoomVO vo) throws Exception;

	public CheckUpRoomVO readPage(Integer crid) throws Exception;

	public List<CheckUpRoomVO> listAll() throws Exception;

	public void update(CheckUpRoomVO vo) throws Exception;

	public void delete(Integer crid) throws Exception;

	public List<CheckUpRoomVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCreiteria(Criteria cri) throws Exception;

	public List<CheckUpRoomVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
