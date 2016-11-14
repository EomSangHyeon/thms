package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.MemberVO;
import com.thms.domain.RoomVO;

@Repository
public class RoomDAOImpl implements RoomDAO{
	@Inject
	private SqlSession session;
	private static String namespace = "com.thms.mapper.RoomMapper";
	private static String namespace1 = "com.thms.mapper.UserMapper";
	
	@Override
	public void insert(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insert",vo);
		
	}
	@Override
	public RoomVO readPage(Integer rmid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace +".readPage", rmid);
	}
	@Override
	public List<RoomVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}
	@Override
	public void update(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}
	@Override
	public void delete(Integer rmid) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",rmid);
	}

}
