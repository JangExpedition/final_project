package com.sh.j3l.movie.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class movieEntity {
	private int no;
	private String title;
	private genre genre;
	private String director;
	private String actors;
	private String synopsis;
	private int limit_age;
}
