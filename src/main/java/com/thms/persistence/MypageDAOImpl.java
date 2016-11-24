package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.CheckUpReservationViewVO;
import com.thms.domain.ReservationViewVO;
import com.thms.domain.SearchCriteria;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.thms.mapper.ReservationMapper";

	@Override
	public List<ReservationViewVO> getScheduleListByUID(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace +".getScheduleListByUID", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace +".listSearchCount", cri);
	}

	@Override
	public void del(int rid) throws Exception {
		sqlSession.delete(namespace +".del", rid);
	}

	@Override
	public List<CheckUpReservationViewVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listchSearch",cri);
	}

	@Override
	public int listcheckupCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".listchSearchCount",cri);
	}
	
}