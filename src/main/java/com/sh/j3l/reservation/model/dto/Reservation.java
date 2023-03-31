package com.sh.j3l.reservation.model.dto;

import com.sh.j3l.movie.model.dto.Genre;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {

	private String id;
	private String seatNo;
	private int theaterNo;
	private String startTime;
	private String endTime;
	private String cinemaName;
	private String title;
	private Genre genre;
	private int runningTime;
	private int limitAge;
}
