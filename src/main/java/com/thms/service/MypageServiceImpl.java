package com.thms.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.thms.domain.PatientViewVO;
import com.thms.domain.ReservationViewVO;
import com.thms.domain.SearchCriteria;
import com.thms.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	@Inject
	private MypageDAO dao;

	@Override
	public List<ReservationViewVO> getScheduleListByUID(SearchCriteria cri) throws Exception {
		return dao.getScheduleListByUID(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void del(int rid) throws Exception {
		dao.del(rid);
	}

	@Override
	public List<PatientViewVO> getHospitalizeListByUID(SearchCriteria cri) throws Exception {
		return dao.getHospitalizeListByUID(cri);
	}

	@Override
	public int listHospitalizeCount(SearchCriteria cri) throws Exception {
		return dao.listHospitalizeCount(cri);
	}
}