package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.CheckUpReservationVO;
import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.SearchCriteria;
import com.thms.persistence.CheckUpReservationDAO;
@Service
public class CheckUpReservationServiceImpl implements CheckUpReservationService{

	@Inject
	private CheckUpReservationDAO dao;
	
	@Override
	public void insert(CheckUpReservationVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	////////////////////////list/////////////////////////////////
	@Override
	public List<CheckUpReservationVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}
	@Override
	public int listCountCreiteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}
	@Override
	public List<CheckUpReservationVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}
	
//////////////////////////member///////////////////////////
	@Override
	public List<MemberVO> memlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memlistCriteria(cri);
	}

	@Override
	public int memlistCountCreiteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memcountPaging(cri);
	}

	@Override
	public List<MemberVO> memlistSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memlistSearch(cri);
	}

	@Override
	public int memlistSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memlistSearchCount(cri);
	}
//////////////////////////checkup////////////////////////////////////////
	@Override
	public List<CheckUpVO> checkuplistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkuplistCriteria(cri);
	}
	@Override
	public int checkuplistCountCreiteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkupcountPaging(cri);
	}
	@Override
	public List<CheckUpVO> checkuplistSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkuplistSearch(cri);
	}
	@Override
	public int checkuplistSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkuplistSearchCount(cri);
	}
//////////////////////////checkuproom////////////////////////////////////////
	@Override
	public List<CheckUpRoomVO> checkuproomlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkuproomlistCriteria(cri);
	}
	@Override
	public int checkuproomlistCountCreiteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkupcountPaging(cri);
	}
	@Override
	public List<CheckUpRoomVO> checkuproomlistSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkuproomlistSearch(cri);
	}
	@Override
	public int checkuproomlistSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkuplistSearchCount(cri);
	}
//////////////////////////////////////////////////////////////////////
	@Override
	public CheckUpReservationVO readPage(Integer creid) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage(creid);
	}

	@Override
	public void update(CheckUpReservationVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(Integer creid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(creid);
	}
	
}
