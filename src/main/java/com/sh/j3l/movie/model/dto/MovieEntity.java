package com.sh.j3l.movie.model.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieEntity {
	
	private int no;
	private String title;
	private Genre genre;
	private String director;
	private String actors;
	private String synopsis;
	private int limitAge;
	private int runningTime;
	private String openDt;
	private int reservationCount;
	
}
