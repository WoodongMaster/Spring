package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.CommentVO;

public interface CommentDAO {

	int post(CommentVO cvo);

	List<CommentVO> getlist(int bno);

	int edit(CommentVO cvo);

	int delete(int cno);
	
}
