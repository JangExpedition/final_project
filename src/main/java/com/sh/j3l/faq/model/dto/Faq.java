package com.sh.j3l.faq.model.dto;

import java.sql.Date;
import java.time.LocalDateTime;

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
	private int readCount;
	private LocalDateTime createdAt;
	private Classify classify;
}
