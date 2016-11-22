package com.thms.dto;

public class ReservationDTO {
	private int sjid;
	private int did;
	private String searchMonth;

	//Getter
	public int getSjid() {
		return sjid;
	}
	public int getDid() {
		return did;
	}
	public String getSearchMonth() {
		return searchMonth;
	}

	//Setter
	public void setSjid(int sjid) {
		this.sjid = sjid;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public void setSearchMonth(String searchMonth) {
		this.searchMonth = searchMonth;
	}
}
