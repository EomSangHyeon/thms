package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.CheckUpVO;
import com.thms.persistence.CheckUpDAO;

@Service
public class CheckUpServiceImpl implements CheckUpService{

	@Inject 
	private CheckUpDAO dao;
	
	@Override
	public void insert(CheckUpVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public CheckUpVO readPage(Integer chid) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage(chid);
	}

	@Override
	public List<CheckUpVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public void update(CheckUpVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(Integer chid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(chid);
	}

	@Override
	public List<CheckUpVO> listView() throws Exception {
		// TODO Auto-generated method stub
		return dao.listView();
	}

}
