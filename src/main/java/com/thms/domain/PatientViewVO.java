package com.thms.domain;

public class PatientViewVO {
	private int hoid;
	private String uid;
	private String horegdate;
	private int rmid;
	private int did;
	private String sjname;
	private String dname;
	private String rmnumber;

	//Getter
	public int getHoid() {
		return hoid;
	}
	public String getUid() {
		return uid;
	}
	public String getHoregdate() {
		return horegdate;
	}
	public int getRmid() {
		return rmid;
	}
	public int getDid() {
		return did;
	}
	public String getSjname() {
		return sjname;
	}
	public String getDname() {
		return dname;
	}
	public String getRmnumber() {
		return rmnumber;
	}

	//Setter
	public void setHoid(int hoid) {
		this.hoid = hoid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setHoregdate(String horegdate) {
		this.horegdate = horegdate;
	}
	public void setRmid(int rmid) {
		this.rmid = rmid;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public void setSjname(String sjname) {
		this.sjname = sjname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public void setRmnumber(String rmnumber) {
		this.rmnumber = rmnumber;
	}
}
