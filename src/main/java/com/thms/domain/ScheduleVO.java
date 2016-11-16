package com.thms.domain;

public class ScheduleVO {
	private int sid;
	private int sjid;
	private int did;
	private String weekday;
	private String ampm;
	private int medicalCount;

	//Getter
	public int getSid() {
		return sid;
	}
	public int getSjid() {
		return sjid;
	}
	public int getDid() {
		return did;
	}
	public String getWeekday() {
		return weekday;
	}
	public String getAmpm() {
		return ampm;
	}
	public int getMedicalCount() {
		return medicalCount;
	}

	//Setter
	public void setSid(int sid) {
		this.sid = sid;
	}
	public void setSjid(int sjid) {
		this.sjid = sjid;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public void setAmpm(String ampm) {
		this.ampm = ampm;
	}
	public void setMedicalCount(int medicalCount) {
		this.medicalCount = medicalCount;
	}
}
