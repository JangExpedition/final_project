package com.sh.j3l.notice.model.dto;

import lombok.Getter;

@Getter
public enum Classifyy {
	JUMGUM("[점검]"),
	GITA("[기타]"),
	HAENGSA("[행사]"),
	EVENT("[이벤트]"),
	GKJANG("[극장]");
	
	
	private final String koreanNamee;
	
	private Classifyy(String koreanNamee) {
		this.koreanNamee = koreanNamee;
	}
	
	public String getKoreanNamee() {
		return koreanNamee;
	}
}
