package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.SubjectVO;
@Repository
public class DoctorDAOImpl implements DoctorDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.thms.mapper.DoctorMapper";
	
	@Override
	public void insert(DoctorVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert",vo);
		
	}

	@Override
	public List<DoctorVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	@Override
	public DoctorVO readPage(Integer did) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace +".readPage", did);
	}

	@Override
	public void update(DoctorVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer did) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",did);
	}

	@Override
	public List<DoctorVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if(page<=0){
			page=1;
		}
		page=(page -1) * 10;
		return session.selectList(namespace+".listPage",page);
	}

	@Override
	public List<DoctorVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listCriteria",cri);
	}

	

}
