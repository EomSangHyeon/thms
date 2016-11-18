package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.DoctorVO;
import com.thms.domain.SubjectVO;

@Repository
public class IntroduceDAOImpl implements IntroduceDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.thms.mapper.IntroduceMapper";

	@Override
	public List<SubjectVO> subjectList() throws Exception {
		return session.selectList(namespace + ".subjectList");
	}

	@Override
	public List<DoctorVO> doctorList() throws Exception {
		return session.selectList(namespace + ".doctorList");
	}
}
