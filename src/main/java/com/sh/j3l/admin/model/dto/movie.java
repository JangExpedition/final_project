package com.sh.j3l.admin.model.dto;

import java.time.LocalDateTime;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class movie {
	private int no;
	private String title;
	private String genre;
	private String director;
	private String actors;
	private String synopsis;
	private int limit_age;

}
