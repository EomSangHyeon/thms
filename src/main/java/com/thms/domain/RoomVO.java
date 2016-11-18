package com.thms.domain;

public class RoomVO {
	private int rmid;
	private String rmnumber;
	private String rmcurrentcount;
	private String rmheadcount;

	public String getRmcurrentcount() {
		return rmcurrentcount;
	}

	public void setRmcurrentcount(String rmcurrentcount) {
		this.rmcurrentcount = rmcurrentcount;
	}

	public int getRmid() {
		return rmid;
	}

	public void setRmid(int rmid) {
		this.rmid = rmid;
	}

	public String getRmnumber() {
		return rmnumber;
	}

	public void setRmnumber(String rmnumber) {
		this.rmnumber = rmnumber;
	}

	public String getRmheadcount() {
		return rmheadcount;
	}

	public void setRmheadcount(String rmheadcount) {
		this.rmheadcount = rmheadcount;
	}

}
