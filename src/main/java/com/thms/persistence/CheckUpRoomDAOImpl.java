package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.CheckUpRoomVO;
@Repository
public class CheckUpRoomDAOImpl implements CheckUpRoomDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.thms.mapper.CheckUpRoomMapper";
	
	@Override
	public void insert(CheckUpRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert",vo);
	}

	@Override
	public CheckUpRoomVO readPage(Integer crid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace +".readPage", crid);
	}

	@Override
	public List<CheckUpRoomVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	@Override
	public void update(CheckUpRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer crid) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",crid);
	}

}
