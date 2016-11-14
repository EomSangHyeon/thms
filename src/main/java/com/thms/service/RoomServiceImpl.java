package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.MemberVO;
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
	@Override
	public RoomVO readPage(Integer rmid) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage(rmid);
	}
	@Override
	public List<RoomVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	@Override
	public void update(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	@Override
	public void delete(Integer rmid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rmid);
	}

}
