package com.sh.j3l.movie.model.dto;

public enum Genre {
//	ACTION("액션"),
//	COMEDY("코미디"),
//	ROMANCE("로맨스"),
//	ANIMATION("애니"),
//	HORROR("호러"),
//	FANTASY("판타지"),
//	DOCUMENTARY("다큐"),
//	DRAMA("드라마");
	액션("ACTION"),
	코미디("COMEDY"),
	로맨스("ROMANCE"),
	애니("ANIMATION"),
	호러("HORROR"),
	판타지("FANTASY"),
	다큐("DOCUMENTARY"),
	드라마("DRAMA");
	
	
	
	private final String value;

    Genre(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
