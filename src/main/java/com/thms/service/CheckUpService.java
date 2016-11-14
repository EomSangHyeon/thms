package com.thms.service;

import java.util.List;

import com.thms.domain.CheckUpVO;

public interface CheckUpService {
	public void insert(CheckUpVO vo) throws Exception;
	
	public CheckUpVO readPage(Integer chid) throws Exception;
	
	public List<CheckUpVO> listView() throws Exception;
	
	public List<CheckUpVO> listAll() throws Exception;
	
	public void update(CheckUpVO vo)throws Exception;
	
	public void delete(Integer chid) throws Exception;
}
