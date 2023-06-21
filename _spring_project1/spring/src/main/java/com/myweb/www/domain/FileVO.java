package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
//	create table file(
//			uuid varchar(256) not null,
//			save_path varchar(256) not null,
//			file_name varchar(256) not null,
//			file_type tinyint(1) default 0,
//			bno int,
//			file_size int,
//			reg_date datetime default now(),
//			primary key(uuid));
	

	private String uuid;
	private String save_path;
	private String file_name;
	private int file_type;
	private int bno;
	private long file_size;
	private String reg_date;
}
