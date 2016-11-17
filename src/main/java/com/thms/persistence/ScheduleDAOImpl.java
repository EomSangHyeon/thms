package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.thms.mapper.ScheduleMapper";

	@Override
	public List<ScheduleVO> calendar(ScheduleVO vo) throws Exception {
		return sqlSession.selectList(namespace +".calendar", vo);
	}

	@Override
	public void add(ScheduleVO vo) throws Exception {
		sqlSession.insert(namespace +".add", vo);
	}
}
