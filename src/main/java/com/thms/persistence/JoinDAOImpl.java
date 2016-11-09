package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.MemberVO;
import com.thms.domain.SearchCriteria;

@Repository
public class JoinDAOImpl implements JoinDAO {

	static final String namespace = "com.thms.mapper.UserMapper";

	@Inject
	SqlSession session;

	public String checkUid(String uid) {

		return session.selectOne(namespace + ".checkId", uid);

	}

	@Override
	public String checkUnick(String unick) {

		return session.selectOne(namespace + ".checkNick", unick);
	}

	@Override
	public void memberJoin(MemberVO vo) {

		session.insert(namespace + ".joinMember", vo);

	}

	@Override
	public void memberModify(MemberVO vo) {

		session.update(namespace + ".updateMember", vo);

	}

	@Override
	public void statusModify(MemberVO vo) {

		session.update(namespace + ".modifyStatus", vo);

	}

	@Override
	public List<MemberVO> listCriteria(SearchCriteria cri) {

		return session.selectList(namespace + ".searchMember", cri);
	}

	@Override
	public int searchTotal(SearchCriteria cri) {

		return session.selectOne(namespace+".searchTotal", cri);
	}

}
