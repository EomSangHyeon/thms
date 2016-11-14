package com.thms.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.BoardVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.thms.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert(namespace +".create", vo);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return sqlSession.selectOne(namespace +".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update(namespace +".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		sqlSession.delete(namespace +".delete", bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return sqlSession.selectList(namespace +".listAll");
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if(page <= 0)
			page = 1;

		page = (page - 1) * 10;

		return sqlSession.selectList(namespace +".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace +".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace +".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace +".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace +".listSearchCount", cri);
	}
	
	@Override
	public int countNewsPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".countNewsPaging", cri);
	}
	
	@Override
	public List<BoardVO> listNewsSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".listNewsSearch", cri);
	}

	@Override
	public int listNewsSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".listNewsSearchCount", cri);
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);

		sqlSession.update(namespace +".updateReplyCnt", paramMap);
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		sqlSession.update(namespace +".updateViewCnt", bno);
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		sqlSession.insert(namespace +".addAttach", fullName);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return sqlSession.selectList(namespace +".getAttach", bno);
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		sqlSession.delete(namespace +".deleteAttach", bno);
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);

		sqlSession.insert(namespace +".replaceAttach", paramMap);
	}



	
}
