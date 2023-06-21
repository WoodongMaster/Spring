package com.myweb.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class PagingVO {
	private int pageNo; // 현재 화면에 출력된 페이지번호
	private int qty; // 한 페이지에 표시되는 게시글 수
	
	public PagingVO() {
		this(1,10);
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo=pageNo;
		this.qty=qty;
	}
	
	public int getPageStart() { // DB limit 시작값
		return (this.pageNo-1)*qty;
	}
	
}
