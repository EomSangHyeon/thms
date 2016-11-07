package com.thms.dto;

public class LoginDTO {
	private String uid;
	private String upw;
	private boolean useCookie;

	//Getter
	public String getUid() {
		return uid;
	}
	public String getUpw() {
		return upw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}

	//Setter
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
}
