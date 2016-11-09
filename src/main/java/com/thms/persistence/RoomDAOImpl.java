package com.thms.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.RoomVO;

@Repository
public class RoomDAOImpl implements RoomDAO{
	@Inject
	private SqlSession session;
	private static String namespace = "com.thms.mapper.RoomMapper";
	@Override
	public void insert(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert",vo);
		
	}

}
