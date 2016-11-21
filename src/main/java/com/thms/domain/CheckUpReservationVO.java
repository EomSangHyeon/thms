package com.thms.domain;

import java.sql.Date;

public class CheckUpReservationVO {
	private int creid;
	private Date credate;
	private String uid;
	private int chid;
	private int crid;
	public int getCreid() {
		return creid;
	}
	public void setCreid(int creid) {
		this.creid = creid;
	}
	
	public Date getCredate() {
		return credate;
	}
	public void setCredate(Date credate) {
		this.credate = credate;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getChid() {
		return chid;
	}
	public void setChid(int chid) {
		this.chid = chid;
	}
	public int getCrid() {
		return crid;
	}
	public void setCrid(int crid) {
		this.crid = crid;
	}
	
	
}
