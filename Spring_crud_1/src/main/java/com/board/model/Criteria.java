package com.board.model;

public class Criteria {

	// 현재페이지
	private int nowPage;

	// 페이지당 게시물 수
	private int amount;

	// 행조절
	private int limit;
		
	// 검색
	private String keyword;

	public Criteria() {
		this(1, 10);
		this.limit = 0;
	}

	public Criteria(int nowPage, int amount) {
		this.nowPage = nowPage;
		this.amount = amount;
		this.limit = (nowPage - 1) * amount;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		this.limit = (nowPage - 1) * this.amount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		this.limit = (this.nowPage - 1) * amount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [nowPage=" + nowPage + ", amount=" + amount + ", limit=" + limit + ", keyword=" + keyword
				+ "]";
	}

	
	
}
