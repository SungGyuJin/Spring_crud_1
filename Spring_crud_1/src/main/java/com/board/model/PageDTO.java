package com.board.model;

public class PageDTO {

	// 시작페이지 (ex 1, 11, 21, 31, 41 ...)
	private int startPage;

	// 마지막페이지 (ex 10, 20, 30, 40 ...)
	private int endPage;

	// 이전, 다음페이지 버튼유무
	private boolean prev, next;

	// 전체 게시글 수
	private int total;

	// 게시물 정보
	private Criteria cri;

	// PageDTO 생성자 (페이징 로직처리)
	public PageDTO(int total, Criteria cri) {

		this.total = total;
		this.cri = cri;

		// 마지막페이지 구하는 공식 (ex 10, 20, 30, 40 ...) amount = 10 기준
		this.endPage = (int) (Math.ceil(cri.getNowPage() / 10.0)) * 10;

		// 시작페이지 구하는 공식 (ex 1, 11, 21, 31, 41 ...) amount = 10 기준
		this.startPage = this.endPage - 9;

		// 실제 게시글이 끝나는 마지막 페이지 번호 구하는 공식
		int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));

		if (realEnd < endPage) {
			this.endPage = realEnd;
		}

		this.prev = startPage > 1;

		this.next = this.endPage < realEnd;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

}
