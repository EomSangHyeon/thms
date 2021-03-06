package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.SubjectVO;
@Repository
public class SubjectDAOImpl implements SubjectDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.thms.mapper.SubjectMapper";
	
	@Override
	public void input(SubjectVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".sjinput",vo);
		
	}

	@Override
	public List<SubjectVO> listView() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listView");
	}

	@Override
	public List<SubjectVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	@Override
	public SubjectVO readPage(Integer sjid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace +".readPage", sjid);
	}

	@Override
	public void delete(Integer sjid) throws Exception {
		session.delete(namespace+".delete",sjid);
		
	}

	@Override
	public void update(SubjectVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
		
	}

	
}
