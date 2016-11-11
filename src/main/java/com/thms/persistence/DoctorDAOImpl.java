package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.DoctorVO;
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
	public List<DoctorVO> listView(Integer sjid) throws Exception {
		return session.selectList(namespace +".listView", sjid);
	}
}
