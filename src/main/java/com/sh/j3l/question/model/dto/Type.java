package com.sh.j3l.question.model.dto;

public enum Type {
	MUNEE("문의"),
	BULMAN("불만"),
	CHINGCHAN("칭찬"),
	JAEAN("제안"),
	BUNSILMOOL("분실물");
	
	
	
	private String krName;
	
	Type(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}
}
