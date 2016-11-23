package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpRoomViewVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;
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

	@Override
	public List<CheckUpRoomVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCreiteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public List<CheckUpRoomViewVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

	@Override
	public List<CheckUpRoomVO> listView(Integer chid) throws Exception {
		// TODO Auto-generated method stub
		return dao.listView(chid);
	}

	

}