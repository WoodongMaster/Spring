package com.myweb.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// RunWith 실행하고자 하는 class 이름 입력
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTest {
	
	@Inject
	private BoardDAO bdao;
	
	@Test
	public void insertBoard() {
		log.info("Test Insert !");
		
		for(int i=0; i<150; i++) {			
			BoardVO bvo = new BoardVO();
			bvo.setTitle("Test Title"+i);
			bvo.setContent("Test Content"+i);
			bvo.setWriter("abcd");
			bdao.register(bvo);
		}
	}
}
