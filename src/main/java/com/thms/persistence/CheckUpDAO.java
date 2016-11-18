package com.thms.persistence;

import java.util.List;

import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.SearchCriteria;

public interface CheckUpDAO {
	public void insert(CheckUpVO vo) throws Exception;
	
	public CheckUpVO readPage(Integer chid) throws Exception;
	
	public List<CheckUpVO> listView() throws Exception;
	
	public List<CheckUpVO> listAll() throws Exception;	
	
	public void update(CheckUpVO vo)throws Exception;
	
	public void delete(Integer chid) throws Exception;
	
	public List<CheckUpVO> listPage(int page) throws Exception;

	public List<CheckUpVO> listCriteria(Criteria cri) throws Exception;
	
	public List<CheckUpVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
}
