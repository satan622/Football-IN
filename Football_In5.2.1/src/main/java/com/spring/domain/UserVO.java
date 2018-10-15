package com.spring.domain;

import java.util.Date;

public class UserVO {
	private String uid;
	private String upw;
	private String uname;
	private String location;
	private Date regdate;
	private String teamname;
	private boolean manager;
	
	public boolean isManager() {
		return manager;
	}
	public void setManager(boolean manager) {
		this.manager = manager;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", location=" + location + ", regdate="
				+ regdate + ", teamname=" + teamname + "]";
	}
	
	
}
