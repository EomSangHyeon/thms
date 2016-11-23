package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpRoomViewVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;
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

	@Override
	public List<CheckUpRoomVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<CheckUpRoomVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public List<CheckUpRoomViewVO> listSearch(SearchCriteria cri) throws Exception {
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

	@Override
	public List<CheckUpRoomVO> listView(Integer chid) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(chid);
		return session.selectList(namespace+".listView",chid);
	}

}
