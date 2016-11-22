package com.thms.domain;

public class ReservationVO {
	private int rid;
	private int sjid;
	private int did;
	private String ampm;
	private String rdate;
	private String uid;

	//Getter
	public int getRid() {
		return rid;
	}
	public int getSjid() {
		return sjid;
	}
	public int getDid() {
		return did;
	}
	public String getAmpm() {
		return ampm;
	}
	public String getRdate() {
		return rdate;
	}
	public String getUid() {
		return uid;
	}

	//Setter
	public void setRid(int rid) {
		this.rid = rid;
	}
	public void setSjid(int sjid) {
		this.sjid = sjid;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public void setAmpm(String ampm) {
		this.ampm = ampm;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
}
