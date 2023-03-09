package com.sh.j3l.faq.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	private int no;
	private String title;
	private String content;
	private Classify classify;
}
