package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.RoomVO;
import com.thms.domain.SearchCriteria;

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
	@Override
	public List<RoomVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}
	@Override
	public List<RoomVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}
	@Override
	public List<RoomVO> listSearch(SearchCriteria cri) throws Exception {
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
