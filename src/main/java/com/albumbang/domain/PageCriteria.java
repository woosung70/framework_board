package com.albumbang.domain;

public class PageCriteria {
	
	private int pageNum=1;	//현재 페이지 번호
	private int amount=5;	//페이지당 데이터 갯수
	
	private String keyword="";

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "PageCriteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + "]";
	}
	
	
}