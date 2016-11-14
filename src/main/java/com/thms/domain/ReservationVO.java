package com.thms.domain;

import java.util.Date;

public class ReservationVO {
	private int rid;
	private Date rdate;

	//Getter
	public int getRid() {
		return rid;
	}
	public Date getRdate() {
		return rdate;
	}

	//Setter
	public void setRid(int rid) {
		this.rid = rid;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
}
