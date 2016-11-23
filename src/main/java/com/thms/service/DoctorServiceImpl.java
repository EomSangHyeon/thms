package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.DoctorViewVO;
import com.thms.domain.SearchCriteria;
import com.thms.persistence.DoctorDAO;

@Service
public class DoctorServiceImpl implements DoctorService{
	@Inject
	private	DoctorDAO dao;
	@Override
	public void insert(DoctorVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}
	@Override
	public List<DoctorVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}
	@Override
	public DoctorVO readPage(Integer did) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage(did);
	}
	@Override
	public void update(DoctorVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	@Override
	public void delete(Integer did) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(did);
		
	}
/*	@Override
	public List<DoctorVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(page);
	}*/
	@Override
	public List<DoctorVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
		
	}

	@Override
	public List<DoctorVO> listView(Integer sjid) throws Exception {
		return dao.listView(sjid);
	}
	@Override
	public int listCountCreiteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}
	@Override
	public List<DoctorViewVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}
}
