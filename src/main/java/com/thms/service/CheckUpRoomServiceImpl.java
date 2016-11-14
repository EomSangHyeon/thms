package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.CheckUpRoomVO;
import com.thms.persistence.CheckUpRoomDAO;

@Service
public class CheckUpRoomServiceImpl implements CheckUpRoomService{

	@Inject 
	private CheckUpRoomDAO dao;
	
	
	@Override
	public void insert(CheckUpRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public CheckUpRoomVO readPage(Integer crid) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage(crid);
	}

	@Override
	public List<CheckUpRoomVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public void update(CheckUpRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(Integer crid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(crid);
	}

	

}
