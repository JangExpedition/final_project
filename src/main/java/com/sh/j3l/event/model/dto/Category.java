package com.sh.j3l.event.model.dto;

public enum Category {
	SPECIAL("스페셜"),
	MOVIEYEME("영화/예매"),
	MEMBERSHIP("멤버십"),
	JAEHYUSALE("제휴/할인");
	
	private final String krName;
	
	Category(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}
}
