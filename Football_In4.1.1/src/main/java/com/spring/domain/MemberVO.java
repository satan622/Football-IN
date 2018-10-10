package com.spring.domain;

import java.util.Date;

public class MemberVO {
	private String uid;
	private String tname;
	private String uname;
	private String location;
	private Date regdate;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
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
	@Override
	public String toString() {
		return "MemberVO [uid=" + uid + ", tname=" + tname + ", uname=" + uname + ", location=" + location
				+ ", regdate=" + regdate + "]";
	}
	
}
