package com.spring.domain;

public class MatchVO {
	private Integer mno;
	private String home;
	private String away;
	private int hscore;
	private int ascore;
	private String stadium;
	private String starttime;
	private String endtime;
	private String event;
	
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String away) {
		this.away = away;
	}
	public int getHscore() {
		return hscore;
	}
	public void setHscore(int hscore) {
		this.hscore = hscore;
	}
	public int getAscore() {
		return ascore;
	}
	public void setAscore(int ascore) {
		this.ascore = ascore;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	@Override
	public String toString() {
		return "MatchVO [mno=" + mno + ", home=" + home + ", away=" + away + ", hscore=" + hscore + ", ascore=" + ascore
				+ ", stadium=" + stadium + ", starttime=" + starttime + ", endtime=" + endtime + ", event=" + event
				+ "]";
	}
	
}
