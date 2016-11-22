package com.thms.persistence;

import java.util.List;

import com.thms.domain.Criteria;
import com.thms.domain.MemberVO;
import com.thms.domain.PatientVO;
import com.thms.domain.RoomVO;
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
	public void deleteUser(MemberVO vo);
	
	public void joinForPatient(PatientVO vo);

	public List<PatientVO> selectPatientList(Criteria cri);

	public List<MemberVO> selectUser(Criteria cri);
	
	public int searchTotalPatient();

	public List<PatientVO> searchPatientList(SearchCriteria cri);

	public int searchPatientCount(SearchCriteria cri);

	public List<PatientVO> selectOnePatient(String hoid);

	public void updatePatient(PatientVO vo);

	public void deletePatient(String hoid);

	public String checkRoom(String rmid);
}
