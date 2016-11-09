package com.thms.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.RoomVO;
import com.thms.persistence.RoomDAO;
@Service
public class RoomServiceImpl implements RoomService{
	@Inject
	private RoomDAO dao;
	@Override
	public void insert(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

}
