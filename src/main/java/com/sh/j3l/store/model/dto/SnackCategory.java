package com.sh.j3l.store.model.dto;

import lombok.Getter;

@Getter
public enum SnackCategory {

	POPCORN("팝콘"),
	DRINK("음료"),
	COMBO("콤보"),
	ALL("전체"),
	SNACK("스낵");
	
	private final String krName;
		
	SnackCategory(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}
	
}