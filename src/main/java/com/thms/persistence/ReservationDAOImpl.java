package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.ReservationVO;
import com.thms.dto.ReservationDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String manespace = "com.thms.mapper.ReservationMapper";

	@Override
	public void add(ReservationVO vo) throws Exception {
		sqlSession.insert(manespace +".add", vo);
	}

	@Override
	public List<ReservationVO> getScheduleList(ReservationDTO dto) throws Exception {
		return sqlSession.selectList(manespace +".getScheduleList", dto);
	}
}
