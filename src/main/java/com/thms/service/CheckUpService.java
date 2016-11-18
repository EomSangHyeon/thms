package com.thms.service;

import java.util.List;

import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;

public interface CheckUpService {
	public void insert(CheckUpVO vo) throws Exception;
	
	public CheckUpVO readPage(Integer chid) throws Exception;
	
	public List<CheckUpVO> listView() throws Exception;
	
	public List<CheckUpVO> listAll() throws Exception;
	
	public void update(CheckUpVO vo)throws Exception;
	
	public void delete(Integer chid) throws Exception;
	
	public List<CheckUpVO> listCriteria(Criteria cri) throws Exception;	
	
	public int listCountCreiteria(Criteria cri) throws Exception;
	
	public List<CheckUpVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
