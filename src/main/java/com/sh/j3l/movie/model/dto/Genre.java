package com.sh.j3l.movie.model.dto;


import lombok.Getter;


@Getter
public enum Genre {
	ACTION("액션"),
	COMEDY("코미디"),
	ROMANCE("로맨스"),
	ANIMATION("애니"),
	HORROR("호러"),
	FANTASY("판타지"),
	DOCUMENTARY("다큐"),
	DRAMA("드라마");
//	ACTION,
//	COMEDY,
//	ROMANCE,
//	ANIMATION,
//	HORROR,
//	FANTASY,
//	DOCUMENTARY,
//	DRAMA
	
	private final String movieName;
	
	private Genre(String movieName) {
		this.movieName = movieName;
	}
	
	public String getMovieName() {
		return movieName;
	}
}
