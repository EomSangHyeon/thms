package com.thms.domain;

import java.sql.Date;

public class CheckUpReservationViewVO {
	private int v_crid;
	private Date v_credate;
	private String v_uid;
	private String v_chname;
	private String cr_number;
	public int getV_crid() {
		return v_crid;
	}
	public void setV_crid(int v_crid) {
		this.v_crid = v_crid;
	}
	public Date getV_credate() {
		return v_credate;
	}
	public void setV_credate(Date v_credate) {
		this.v_credate = v_credate;
	}
	public String getV_uid() {
		return v_uid;
	}
	public void setV_uid(String v_uid) {
		this.v_uid = v_uid;
	}
	public String getV_chname() {
		return v_chname;
	}
	public void setV_chname(String v_chname) {
		this.v_chname = v_chname;
	}
	public String getCr_number() {
		return cr_number;
	}
	public void setCr_number(String cr_number) {
		this.cr_number = cr_number;
	}
	
	
}
