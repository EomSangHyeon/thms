package com.thms.persistence;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.RoomVO;
import com.thms.domain.SearchCriteria;

public interface RoomDAO {
	public void insert(RoomVO vo) throws Exception;

	public RoomVO readPage(Integer rmid) throws Exception;

	public List<RoomVO> listAll() throws Exception;

	public void update(RoomVO vo) throws Exception;

	public void delete(Integer rmid) throws Exception;

	public List<RoomVO> listPage(int page) throws Exception;

	public List<RoomVO> listCriteria(Criteria cri) throws Exception;

	public List<RoomVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;
}
