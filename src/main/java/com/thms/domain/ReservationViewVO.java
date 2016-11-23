package com.thms.domain;

public class ReservationViewVO {
	private int rid;
	private int sjid;
	private int did;
	private String ampm;
	private String rdate;
	private String uid;
	private String sjname;
	private String dname;
	private String dclinic;

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
	public String getSjname() {
		return sjname;
	}
	public String getDname() {
		return dname;
	}
	public String getDclinic() {
		return dclinic;
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
	public void setSjname(String sjname) {
		this.sjname = sjname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public void setDclinic(String dclinic) {
		this.dclinic = dclinic;
	}
}