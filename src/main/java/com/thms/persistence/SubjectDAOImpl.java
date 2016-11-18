package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;
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

	@Override
	public List<SubjectVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<SubjectVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public List<SubjectVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listSearchCount",cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".countPaging", cri);
	}

	
}
