package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> showlist(PagingVO pvo);

//	BoardVO showpost(int bno);
	
	BoardDTO showpost(int bno);

	int modify(BoardVO bvo);

	int delete(int bno);

	void upcount(int bno);

	int getTotalCount();

	int register(BoardDTO bdto);

	int modify_file(BoardDTO bdto);

	int removeFile(String uuid);
	
	
}
