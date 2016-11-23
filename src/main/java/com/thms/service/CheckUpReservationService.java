package com.thms.service;

import java.util.List;

import com.thms.domain.CheckUpReservationVO;
import com.thms.domain.CheckUpReservationViewVO;
import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.SearchCriteria;

public interface CheckUpReservationService {
	public void insert(CheckUpReservationVO vo) throws Exception;
	
	public CheckUpReservationVO readPage(Integer creid) throws Exception;
	
	public void update(CheckUpReservationVO vo)throws Exception;
	
	public void delete(Integer creid) throws Exception;
	////////////////list///////////////////////////////

	public List<CheckUpReservationVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCreiteria(Criteria cri) throws Exception;

	public List<CheckUpReservationViewVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;	
	
	//////////////////member///////////////////////////
	public List<MemberVO> memlistCriteria(Criteria cri) throws Exception;

	public int memlistCountCreiteria(Criteria cri) throws Exception;

	public List<MemberVO> memlistSearchCriteria(SearchCriteria cri) throws Exception;

	public int memlistSearchCount(SearchCriteria cri) throws Exception;
	
	/////////////////////checkup//////////////////////////
	
	public List<CheckUpVO> checkuplistCriteria(Criteria cri) throws Exception;

	public int checkuplistCountCreiteria(Criteria cri) throws Exception;

	public List<CheckUpVO> checkuplistSearchCriteria(SearchCriteria cri) throws Exception;

	public int checkuplistSearchCount(SearchCriteria cri) throws Exception;
	
	public List<CheckUpVO> test(SearchCriteria cri) throws Exception;
	/////////////////////checkuproom//////////////////////////
	
	public List<CheckUpRoomVO> checkuproomlistCriteria(Criteria cri) throws Exception;

	public int checkuproomlistCountCreiteria(Criteria cri) throws Exception;

	public List<CheckUpRoomVO> checkuproomlistSearchCriteria(SearchCriteria cri) throws Exception;

	public int checkuproomlistSearchCount(SearchCriteria cri) throws Exception;
	
}
