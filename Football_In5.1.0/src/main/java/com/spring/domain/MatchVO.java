package com.spring.domain;

import java.sql.Timestamp;
import java.util.Date;

public class MatchVO {
	private Integer mno;
	private String writer;
	private String home;
	private String away;
	private int hscore;
	private int ascore;
	private String stadium;
	private Timestamp starttime;
	private Timestamp endtime;
	private String event;

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

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

	public Timestamp getStarttime() {
		return starttime;
	}

	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}

	public Timestamp getEndtime() {
		return endtime;
	}

	public void setEndtime(Timestamp endtime) {
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
		return "MatchVO [mno=" + mno + ", writer=" + writer + ", home=" + home + ", away=" + away + ", hscore=" + hscore
				+ ", ascore=" + ascore + ", stadium=" + stadium + ", starttime=" + starttime + ", endtime=" + endtime
				+ ", event=" + event + "]";
	}

}
