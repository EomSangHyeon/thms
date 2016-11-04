package com.thms.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.thms.domain.BoardVO;
import com.thms.domain.Criteria;
import com.thms.domain.SearchCriteria;
import com.thms.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {
	@Inject
	private BoardDAO dao;

	private static final Logger logger = LoggerFactory.getLogger("BoardDAOImpl.java");

	/*@Test
	public void testGetView() throws Exception {
		logger.info(dao.getView(1).toString());
	}*/

	/*@Test
	public void testGetList() throws Exception {
		logger.info(dao.getList().toString());
	}*/

	/*@Test
	public void testGetListPage() throws Exception {
		int page = 3;
		List<BoardVO> list = dao.getListPage(page);

		for(BoardVO boardVO : list) {
			logger.info(boardVO.getIdx() +" : "+ boardVO.getTitle());
		}
	}*/

	/*@Test
	public void testGetListCriteria() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);

		List<BoardVO> list = dao.getListCriteria(cri);
		for(BoardVO boardVO : list) {
			logger.info(boardVO.getIdx() +" : "+ boardVO.getTitle());
		}
	}*/

	/*@Test
	public void testURI1() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/view").queryParam("idx", 12).queryParam("perPageNum", 20).build();

		logger.info("/board/view?idx=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}*/

	/*@Test
	public void testURI2() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/{module}/{page}").queryParam("idx", 12).queryParam("perPageNum", 20).build().expand("board", "view").encode();

		logger.info("/board/view?idx=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}*/

	@Test
	public void testDynamic1() throws Exception {
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("트2");
		cri.setSearchType("t");

		logger.info("=========================");

		List<BoardVO> list = dao.listSearch(cri);
		for(BoardVO boardVO : list) {
			logger.info(boardVO.getBno() +" : "+ boardVO.getTitle());
		}

		logger.info("=========================");
		logger.info("COUNT : "+ dao.listSearchCount(cri));
	}

	/*@Test
	public void testAdd() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 제목");
		vo.setContent("테스트 내용");
		vo.setAdd_id("등록자");
		vo.setAdd_ip(java.net.InetAddress.getLocalHost().getHostAddress());

		dao.add(vo);
	}*/

	/*@Test
	public void testEdit() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setIdx(1);
		vo.setTitle("수정된 테스트 제목");
		vo.setContent("수정된 테스트 내용");
		vo.setEdit_id("수정자");
		vo.setEdit_ip(java.net.InetAddress.getLocalHost().getHostAddress());

		dao.edit(vo);
	}*/

	/*@Test
	public void testDel() throws Exception {
		dao.del(1);
	}*/
}
