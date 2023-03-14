package com.sh.j3l.faq.model.dto;

import lombok.Getter;

@Getter
public enum Classify {
	YEME("[예매]"),
	HAWNBULL("[환불]"),
	HOEWON("[회원]"),
	BUNSILMOOL("[분실물]"),
	GITA("[기타]");

	private final String koreanName;
	
	private Classify(String koreanName) {
		this.koreanName = koreanName;
	}
	
	public String getKoreanName() {
		return koreanName;
	}
}
