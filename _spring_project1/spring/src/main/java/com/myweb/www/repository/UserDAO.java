package com.myweb.www.repository;

import com.myweb.www.domain.UserVO;

public interface UserDAO {

	int signUp(UserVO uvo);

	UserVO getUser(String id);

	UserVO login(UserVO uvo);

	UserVO mydetail(String id);

	UserVO pwcheck(String id);

	int modify(UserVO uvo);
	
}
