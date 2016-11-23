package com.thms.persistence;

import java.util.List;

import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpRoomViewVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;

public interface CheckUpRoomDAO {
	
	public void insert(CheckUpRoomVO vo) throws Exception;
	
	public CheckUpRoomVO readPage(Integer crid) throws Exception;
	
	public List<CheckUpRoomVO> listAll() throws Exception;
	
	public List<CheckUpRoomVO> listView(Integer chid) throws Exception;

	public void update(CheckUpRoomVO vo)throws Exception;
	
	public void delete(Integer crid) throws Exception;
	
	public List<CheckUpRoomVO> listPage(int page) throws Exception;

	public List<CheckUpRoomVO> listCriteria(Criteria cri) throws Exception;
	
	public List<CheckUpRoomViewVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
}
