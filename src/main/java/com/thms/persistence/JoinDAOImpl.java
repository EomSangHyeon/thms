package com.thms.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.thms.domain.Criteria;
import com.thms.domain.DoctorVO;
import com.thms.domain.MemberVO;
import com.thms.domain.PatientVO;
import com.thms.domain.SearchCriteria;
import com.thms.domain.SubjectVO;

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

		return session.selectOne(namespace + ".searchTotal", cri);
	}

	@Override
	public List<MemberVO> selectOneMember(String uid) {

		return session.selectList(namespace + ".selectOneMember", uid);
	}

	@Override
	public List<String> selectSearchForPatientUid(String uid) {

		return session.selectList(namespace + ".searchForPatient", uid);
	}

	@Override
	public void joinForPatient(PatientVO vo) {

		session.selectList(namespace + ".joinForPatient", vo);

	}

	@Override
	public List<PatientVO> selectPatientList(Criteria cri) {

		return session.selectList(namespace + ".selectPatientList", cri);
	}

	@Override
	public int searchTotalPatient() {

		return session.selectOne(namespace + ".totalPatient");
	}

	@Override
	public List<PatientVO> searchPatientList(SearchCriteria cri) {

		return session.selectList(namespace + ".searchPatientList", cri);
	}

	@Override
	public int searchPatientCount(SearchCriteria cri) {

		return session.selectOne(namespace + ".searchPatientCount", cri);
	}

	@Override
	public List<PatientVO> selectOnePatient(String hoid) {

		return session.selectList(namespace + ".selectOnePatient", hoid);
	}

	@Override
	public void updatePatient(PatientVO vo) {
		session.update(namespace + ".updatePatient", vo);

	}

	@Override
	public void deletePatient(String hoid) {
		session.delete(namespace + ".deletePatient", hoid);

	}

	@Override
	public String checkRoom(String rmid) {

		return session.selectOne(namespace + ".checkRoon", rmid);
	}

	// 환자 다들고오기
	@Override
	public List<MemberVO> selectUser(Criteria cri) {

		return session.selectList(namespace + ".listUser", cri);
	}

	@Override
	public void deleteUser(MemberVO vo) {


		
		session.delete(namespace + ".deleteUser", vo);

	}

	@Override
	public String checkPw(MemberVO vo) {
		
		return session.selectOne(namespace+".bringPw",vo);
	}

	@Override
	public void myModify(MemberVO vo) {
		session.update(namespace+".myModify",vo);
		
	}

	@Override
	public List<SubjectVO> bringSubject() {
		
		return session.selectList(namespace+".bringSubject");
	}

	@Override
	public List<DoctorVO> bringDoctor(String sjid) {
	
		return session.selectList(namespace+".bringDoctor",sjid);
	}

	

}


