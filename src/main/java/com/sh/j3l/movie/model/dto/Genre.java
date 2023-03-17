package com.sh.j3l.movie.model.dto;



public enum Genre {
	ACTION("액션"),
	COMEDY("코미디"),
	ROMANCE("로맨스"),
	ANIMATION("애니"),
	HORROR("호러"),
	FANTASY("판타지"),
	DOCUMENTARY("다큐"),
	DRAMA("드라마");
	
	private final String krName;
	
	Genre(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}
}
