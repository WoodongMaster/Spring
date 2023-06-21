package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/comment/*")
@Controller
public class CommentController {
	
	@Inject
	private CommentService csv;
	
	//ResponseEntity
	//value : mapping 값 설정, consumes : 가져오는 값의 형태
	//produces : 보낼때의 형식
	@PostMapping(value="/post", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody CommentVO cvo){
		log.info(">>>> cvo : "+cvo);
		//DB 연결
		
		int isOk = csv.post(cvo);
		//리턴을 위해서는 response의 통신상태를 같이 리턴 
		return isOk> 0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/{bno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CommentVO>> list(@PathVariable("bno") int bno){
		log.info(">>>> bno : "+bno);
		List<CommentVO> list = csv.getlist(bno);
		return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);
	}
	
	@PutMapping(value="/{cno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@PathVariable("cno")int cno, @RequestBody CommentVO cvo){
		log.info(">>>> cno : "+cno);
		log.info(">>>> cvo : "+cvo);
		//DB 연결
		
		int isOk = csv.modify(cvo);
		//리턴을 위해서는 response의 통신상태를 같이 리턴 
		return isOk> 0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/{cno}")
	public ResponseEntity<String> delete(@PathVariable("cno") int cno){ 
		log.info(">>>> cno : "+cno);
		int isOk = csv.delete(cno);
		return isOk> 0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
}
