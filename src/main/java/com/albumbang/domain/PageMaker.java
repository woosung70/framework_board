package com.albumbang.domain;

public class PageMaker {
	
	private int startPage;
	private int endPage;
	private int totalPage;
	private boolean prev;
	private boolean next;
	
	private PageCriteria cri;
	
	public PageMaker(PageCriteria cri,int total){
		this.cri=cri;
		this.totalPage = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 5.0) * 5);
		this.startPage = getEndPage()-(5-1);
		
		if(this.totalPage < this.endPage) {
			this.endPage=this.totalPage;
		}
		
		if(this.endPage == 0) {
			this.endPage=1;
		}

		this.next = getEndPage() < this.totalPage;
		this.prev = getStartPage()>1;
		
	}
	
	public PageCriteria getCri() {
		return cri;
	}

	public void setCri(PageCriteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int endPage) {
		this.totalPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", prev=" + prev + ", next=" + next + "]";
	}
}
