package com.sh.j3l.cinema.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

public enum LocationName {
	SEOUL("서울"),
	GYEONGGI("경기"),
	INCHEON("인천"),
	KANGWON("강원"),
	CHUNGCHEONG("대전/충청"),
	DAEGU("대구"),
	BUSANULSAN("부산/울산"),
	GYEONGSANG("경상"),
	JEONLLAJEJU("광주/전라/제주");

	private String krName;
	
	LocationName(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}
}
