package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.SubjectVO;
import com.thms.persistence.SubjectDAO;
@Service
public class SubjectServiceImpl implements SubjectService{

	@Inject
	private SubjectDAO dao;
	
	@Override
	public void input(SubjectVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.input(vo);
	}

	@Override
	public List<SubjectVO> listView() throws Exception {
		// TODO Auto-generated method stub
		return dao.listView();
	}

	@Override
	public List<SubjectVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public SubjectVO readPage(Integer sjid) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage(sjid);
	}

	@Override
	public void update(SubjectVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void delete(Integer sjid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(sjid);
	}

}
