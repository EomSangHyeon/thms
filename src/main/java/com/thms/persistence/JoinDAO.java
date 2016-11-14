package com.thms.persistence;

import java.util.List;

import com.thms.domain.MemberVO;
import com.thms.domain.PatientVO;
import com.thms.domain.SearchCriteria;

public interface JoinDAO {

	public String checkUid(String id);// nuck name도포함

	public String checkUnick(String unick);

	public void memberJoin(MemberVO vo);

	public void memberModify(MemberVO vo);

	public void statusModify(MemberVO vo);

	public List<MemberVO> listCriteria(SearchCriteria cri);

	public int searchTotal(SearchCriteria cri);

	public List<MemberVO> selectOneMember(String uid);

	/// 수정
	public List<String> selectSearchForPatientUid(String uid);
	///
	
	public void joinForPatient(PatientVO vo);
}
