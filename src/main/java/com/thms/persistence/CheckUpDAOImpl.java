package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.SearchCriteria;


@Repository
public class CheckUpDAOImpl implements CheckUpDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.thms.mapper.CheckUpMapper";
	
	
	
	@Override
	public void insert(CheckUpVO vo) throws Exception {
		session.insert(namespace+".insert",vo);
	}



	@Override
	public CheckUpVO readPage(Integer chid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace +".readPage", chid);
	}



	@Override
	public List<CheckUpVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}



	@Override
	public void update(CheckUpVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}



	@Override
	public void delete(Integer chid) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",chid);
	}



	@Override
	public List<CheckUpVO> listView() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listView");
	}



	@Override
	public List<CheckUpVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}



	@Override
	public List<CheckUpVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}



	@Override
	public List<CheckUpVO> listSearch(SearchCriteria cri) throws Exception {
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
