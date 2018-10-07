package com.spring.domain;

public class Criteria {
	private int page;
	private int perPageNum;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 20;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
		}
		this.perPageNum = perPageNum;
	}

	// MyBatis Mapper를 위한 메소드
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}


	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
