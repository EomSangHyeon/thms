package com.thms.persistence;

import java.util.List;

import com.thms.domain.CheckUpReservationVO;
import com.thms.domain.CheckUpReservationViewVO;
import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.SearchCriteria;

public interface CheckUpReservationDAO {
	public void insert(CheckUpReservationVO vo) throws Exception;
	
	public CheckUpReservationVO readPage(Integer creid) throws Exception;
	
	public void update(CheckUpReservationVO vo) throws Exception;
	
	public void delete(Integer creid) throws Exception;
	//////////////list///////////////////////
	public List<CheckUpReservationVO> listPage(int page) throws Exception;

	public List<CheckUpReservationVO> listCriteria(Criteria cri) throws Exception;
	
	public List<CheckUpReservationViewVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	////////////member///////
	public List<MemberVO> memlistPage(int page) throws Exception;

	public List<MemberVO> memlistCriteria(Criteria cri) throws Exception;
	
	public List<MemberVO> memlistSearch(SearchCriteria cri) throws Exception;
	
	public int memlistSearchCount(SearchCriteria cri)throws Exception;

	public int memcountPaging(Criteria cri) throws Exception;
	//////////////////////////////////////
	///////////checkup/////////////////////////
	public List<CheckUpVO> checkuplistPage(int page) throws Exception;

	public List<CheckUpVO> checkuplistCriteria(Criteria cri) throws Exception;
	
	public List<CheckUpVO> checkuplistSearch(SearchCriteria cri) throws Exception;
	
	public int checkuplistSearchCount(SearchCriteria cri)throws Exception;

	public int checkupcountPaging(Criteria cri) throws Exception;
	
	public List<CheckUpVO> test(SearchCriteria cri) throws Exception;
	//////////////////////////////////////
	///////////checkuproom/////////////////////////
	public List<CheckUpRoomVO> checkuproomlistPage(int page) throws Exception;

	public List<CheckUpRoomVO> checkuproomlistCriteria(Criteria cri) throws Exception;
	
	public List<CheckUpRoomVO> checkuproomlistSearch(SearchCriteria cri) throws Exception;
	
	public int checkuproomlistSearchCount(SearchCriteria cri)throws Exception;

	public int checkuproomcountPaging(Criteria cri) throws Exception;
}
