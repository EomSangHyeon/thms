package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.CheckUpReservationVO;
import com.thms.domain.CheckUpRoomVO;
import com.thms.domain.CheckUpVO;
import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.SearchCriteria;
import com.thms.domain.SubjectVO;
@Repository
public class CheckUpReservationDAOImpl implements CheckUpReservationDAO{
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.thms.mapper.CheckUpReservationMapper";
	
	@Override
	public void insert(CheckUpReservationVO vo) throws Exception {
			session.insert(namespace+".insert",vo);
	}

	/////////////////////////////list//////////////////////////////////////
	@Override
	public List<CheckUpReservationVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}
	@Override
	public List<CheckUpReservationVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}
	@Override
	public List<CheckUpReservationVO> listSearch(SearchCriteria cri) throws Exception {
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

///////////////////////////////member//////////////////////////////////
	@Override
	public List<MemberVO> memlistPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".memlistPage", page);
	}

	@Override
	public List<MemberVO> memlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".memlistCriteria", cri);
	}

	@Override
	public List<MemberVO> memlistSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".memlistSearch",cri);
	}

	@Override
	public int memlistSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".memlistSearchCount",cri);
	}

	@Override
	public int memcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".memcountPaging", cri);
	}
/////////////////////////////////////////checkup////////////////////////
	@Override
	public List<CheckUpVO> checkuplistPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".checkuplistPage", page);
	}
	@Override
	public List<CheckUpVO> checkuplistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".checkuplistCriteria", cri);
	}
	@Override
	public List<CheckUpVO> checkuplistSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".checkuplistSearch",cri);
	}
	@Override
	public int checkuplistSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".checkuplistSearchCount",cri);
	}
	@Override
	public int checkupcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".checkupcountPaging", cri);
	}
/////////////////////////////////////////checkuproom////////////////////////
	@Override
	public List<CheckUpRoomVO> checkuproomlistPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".checkuproomlistPage", page);
	}
	@Override
	public List<CheckUpRoomVO> checkuproomlistCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".checkuproomlistCriteria", cri);
	}
	@Override
	public List<CheckUpRoomVO> checkuproomlistSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".checkuproomlistSearch",cri);
	}
	@Override
	public int checkuproomlistSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".checkuproomlistSearchCount",cri);
	}
	@Override
	public int checkuproomcountPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".checkuproomcountPaging", cri);
	}

	@Override
	public CheckUpReservationVO readPage(Integer creid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace +".readPage", creid);
	}

	@Override
	public void update(CheckUpReservationVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer creid) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", creid);
	}
	}
