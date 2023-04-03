package com.sh.j3l.store.model.dto;

public enum SnackCategory {

	POPCORN("팝콘"),
	DRINK("음료"),
	COMBO("콤보"),
	PACKAGE("패키지"),
	SNACK("스낵");
	
	private final String krName;
		
	SnackCategory(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}
}
